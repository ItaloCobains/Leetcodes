package main

import (
	"fmt"
	"os"
)

func convertToBase7(num int) string {

	return ""
}

func main() {
	cases := []struct {
		num  int
		want string
	}{
		{100, "202"},
		{7, "10"},
		{-7, "-10"},
		{0, "0"},
	}
	for _, c := range cases {
		got := convertToBase7(c.num)
		if got != c.want {
			fmt.Fprintf(os.Stderr, "convertToBase7(%d) = %q, want %q\n", c.num, got, c.want)
			os.Exit(1)
		}
	}
	fmt.Println("504 Base 7: ok")
}
