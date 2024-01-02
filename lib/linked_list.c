#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct node
{
    int data;
    struct node *link;
};

struct node *head = NULL;
struct node *current = NULL;

// display the list
void printList()
{
    struct node *ptr = head;
    printf("\n[");

    // start from the beginning
    while (ptr != NULL)
    {
        printf(" %d ", ptr->data);
        ptr = ptr->link;
    }
    printf("]");
}

// insertion at the beginning
void insertatbegin(int data)
{

    // create a link
    struct node *ptr = (struct node *)malloc(sizeof(struct node));
    ptr->data = data;

    // point it to old first node
    ptr->link = head;

    // point first to new first node
    head = ptr;
}

void insertatend(int data)
{

    // create a link
    struct node *ptr = (struct node *)malloc(sizeof(struct node));
    ptr->data = data;
    // struct node *ptr = head;

    // point it to old first node
    while (ptr->link != NULL)
        ptr = ptr->link;

    // point first to new first node
    ptr->link = ptr;
}

void insertafternode(struct node *list, int data)
{
    struct node *ptr = (struct node *)malloc(sizeof(struct node));
    ptr->data = data;
    ptr->link = list->link;
    list->link = ptr;
}
void deleteatbegin()
{
    head = head->link;
}
void deleteatend()
{
    struct node *ptr = head;
    while (ptr->link->link != NULL)
        ptr = ptr->link;
    ptr->link = NULL;
}
void deletenode(int key)
{
    struct node *temp = head, *prev;
    if (temp != NULL && temp->data == key)
    {
        head = temp->link;
        return;
    }

    // Find the key to be deleted
    while (temp != NULL && temp->data != key)
    {
        prev = temp;
        temp = temp->link;
    }

    // If the key is not present
    if (temp == NULL)
        return;

    // Remove the node
    prev->link = temp->link;
}

int searchlist(int key)
{
    struct node *temp = head;
    while (temp != NULL)
    {
        if (temp->data == key)
        {
            return 1;
        }
        temp = temp->link;
    }
    return 0;
}

int main()
{
    int k = 0;
    insertatbegin(12);
    insertatbegin(22);
    insertatend(30);
    insertatend(44);
    insertatbegin(50);
    insertafternode(head->link->link, 33);
    // InsertAtPos(head, 33, 3);

    printf("Linked List: ");

    // print list
    printList();
    deleteatbegin();
    deleteatend();
    deletenode(12);
    printf("\nLinked List after deletion: ");

    // print list
    printList();
    insertatbegin(4);
    insertatbegin(16);
    printf("\nUpdated Linked List: ");
    printList();
    k = searchlist(16);
    if (k == 1)
        printf("\nElement is found");
    else
        printf("\nElement is not present in the list");
}