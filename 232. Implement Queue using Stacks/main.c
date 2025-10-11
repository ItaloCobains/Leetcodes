#include <stdbool.h>
#include <stdlib.h>

typedef struct Node {
  int x;
  struct Node *next;
} Node;

typedef struct {
  Node *list;
  Node *first;
} MyQueue;

MyQueue *myQueueCreate() {
  MyQueue *queue = malloc(sizeof(MyQueue));

  queue->list = NULL;
  queue->first = NULL;

  return queue;
}

void myQueuePush(MyQueue *obj, int x) {
  Node *node = malloc(sizeof(Node));
  node->next = NULL;
  node->x = x;

  if (!obj->first) {
    obj->first = node;
  }

  if (obj->list) {
    obj->list->next = node;
  }

  obj->list = node;
}

bool myQueueEmpty(MyQueue *obj) { return obj->first == NULL; }

int myQueuePop(MyQueue *obj) {
  if (myQueueEmpty(obj))
    return 0;

  Node *node = obj->first;
  obj->first = node->next;

  if (obj->first == NULL)
    obj->list = NULL;

  int x = node->x;

  free(node);

  return x;
}

int myQueuePeek(MyQueue *obj) {
  if (myQueueEmpty(obj))
    return 0;
  Node *node = obj->first;

  return node->x;
}

void myQueueFree(MyQueue *obj) {
  Node *current = obj->first;

  while (current != NULL) {
    Node *tmp = current;
    current = current->next;
    free(tmp);
  }

  free(obj);
}

/**
 * Your MyQueue struct will be instantiated and called as such:
 * MyQueue* obj = myQueueCreate();
 * myQueuePush(obj, x);

 * int param_2 = myQueuePop(obj);

 * int param_3 = myQueuePeek(obj);

  bool param_4 = myQueueEmpty(obj);

 * myQueueFree(obj);
*/
