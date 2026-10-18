#!/usr/bin/env python3

import csv
import json
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

URL = "https://brapi.dev/api/quote/VALE3?range=1y&interval=1d"
OUT = Path(__file__).with_name("vale3_1y.csv")


def main() -> None:
    with urllib.request.urlopen(URL, timeout=30) as r:
        payload = json.load(r)
    rows = sorted(payload["results"][0]["historicalDataPrice"], key=lambda x: x["date"])
    with open(OUT, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "date",
                "open",
                "high",
                "low",
                "close",
                "adj_close",
                "volume",
                "next_close",
                "label",
            ]
        )
        for i, row in enumerate(rows):
            day = (
                datetime.fromtimestamp(row["date"], tz=timezone.utc).date().isoformat()
            )
            nxt = rows[i + 1]["close"] if i + 1 < len(rows) else ""
            label = "" if nxt == "" else int(float(nxt) > float(row["close"]))
            w.writerow(
                [
                    day,
                    row["open"],
                    row["high"],
                    row["low"],
                    row["close"],
                    row["adjustedClose"],
                    row["volume"],
                    nxt,
                    label,
                ]
            )
    print(f"{OUT}: {len(rows)} pregões")


if __name__ == "__main__":
    main()
