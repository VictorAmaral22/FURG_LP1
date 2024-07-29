#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Produto
{
    char nome[30];
    int codigo;
    double preco;
};

typedef struct node
{
    struct Produto produto;
    struct node *next;
} Node;

Node *criarNo(struct Produto produto)
{
    Node *novoNo = (Node *)malloc(sizeof(Node));
    novoNo->produto = produto;
    novoNo->next = NULL;
    return novoNo;
}

void add(Node **list)
{
    struct Produto novoProduto;
    printf("\nDigite o nome do produto (sem espaços): ");
    scanf("%s", novoProduto.nome);
    printf("Digite o codigo do produto: ");
    scanf("%d", &novoProduto.codigo);
    printf("Digite o preço do produto: ");
    scanf("%lf", &novoProduto.preco);

    Node *novoNo = criarNo(novoProduto);

    if (*list == NULL)
    {
        *list = novoNo;
    }
    else
    {
        Node *temp = *list;
        while (temp->next != NULL)
        {
            temp = temp->next;
        }
        temp->next = novoNo;
    }

    printf("\nProduto adicionado com sucesso!\n");
}

void show(Node *list)
{
    if (list == NULL)
    {
        printf("\nNenhum produto na lista.\n");
        return;
    }

    Node *temp = list;
    printf("\n");
    while (temp != NULL)
    {
        printf("Nome: %s, Codigo: %d, Preco: %.2f\n", temp->produto.nome, temp->produto.codigo, temp->produto.preco);
        temp = temp->next;
    }
}

void search(Node *list)
{
    if (list == NULL)
    {
        printf("\nNenhum produto na lista.\n");
        return;
    }

    char nome[30];
    printf("\nDigite o nome do produto a ser buscado: ");
    scanf("%s", nome);

    Node *temp = list;
    while (temp != NULL)
    {
        if (strcmp(temp->produto.nome, nome) == 0)
        {
            printf("Produto encontrado: Nome: %s, Código: %d, Preco: %.2f\n", temp->produto.nome, temp->produto.codigo, temp->produto.preco);
            return;
        }
        temp = temp->next;
    }

    printf("\nProduto nao encontrado.\n");
}

void freeList(Node *list)
{
    Node *temp;
    while (list != NULL)
    {
        temp = list;
        list = list->next;
        free(temp);
    }
}

int main()
{
    Node *list = NULL;
    int opcao;

    do
    {
        printf("\nMenu:\n");
        printf("1. Adicionar produto\n");
        printf("2. Exibir todos os produtos\n");
        printf("3. Buscar produto por nome\n");
        printf("4. Sair\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);

        switch (opcao)
        {
        case 1:
            add(&list);
            break;
        case 2:
            show(list);
            break;
        case 3:
            search(list);
            break;
        case 4:
            freeList(list);
            printf("Saindo...\n");
            break;
        default:
            printf("Opção inválida. Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}
