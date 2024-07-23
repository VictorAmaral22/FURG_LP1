#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Produto {
    char nome[30];
    int codigo;
    double preco;
};

typedef struct node {
    struct Produto produto;
    struct node* next;
} Node;

Node* criarNo(struct Produto produto) {
    Node* novoNo = (Node*)malloc(sizeof(Node));
    novoNo->produto = produto;
    novoNo->next = NULL;
    return novoNo;
}

void adicionarProduto(Node** head) {
    struct Produto novoProduto;
    printf("Digite o nome do produto: ");
    scanf("%s", novoProduto.nome);
    printf("Digite o codigo do produto: ");
    scanf("%d", &novoProduto.codigo);
    printf("Digite o preço do produto: ");
    scanf("%lf", &novoProduto.preco);

    Node* novoNo = criarNo(novoProduto);

    if (*head == NULL) {
        *head = novoNo;
    } else {
        Node* temp = *head;
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = novoNo;
    }

    printf("Produto adicionado com sucesso!\n");
}

void exibirProdutos(Node* head) {
    if (head == NULL) {
        printf("Nenhum produto na lista.\n");
        return;
    }

    Node* temp = head;
    while (temp != NULL) {
        printf("Nome: %s, Codigo: %d, Preco: %.2f\n", temp->produto.nome, temp->produto.codigo, temp->produto.preco);
        temp = temp->next;
    }
}

void buscarProdutoPorNome(Node* head) {
    if (head == NULL) {
        printf("Nenhum produto na lista.\n");
        return;
    }

    char nome[30];
    printf("Digite o nome do produto a ser buscado: ");
    scanf("%s", nome);

    Node* temp = head;
    while (temp != NULL) {
        if (strcmp(temp->produto.nome, nome) == 0) {
            printf("Produto encontrado: Nome: %s, Código: %d, Preco: %.2f\n", temp->produto.nome, temp->produto.codigo, temp->produto.preco);
            return;
        }
        temp = temp->next;
    }

    printf("Produto nao encontrado.\n");
}

void liberarLista(Node* head) {
    Node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main() {
    Node* head = NULL;
    int opcao;

    do {
        printf("\nMenu:\n");
        printf("1. Adicionar produto\n");
        printf("2. Exibir todos os produtos\n");
        printf("3. Buscar produto por nome\n");
        printf("4. Sair\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                adicionarProduto(&head);
                break;
            case 2:
                exibirProdutos(head);
                break;
            case 3:
                buscarProdutoPorNome(head);
                break;
            case 4:
                liberarLista(head);
                printf("Saindo...\n");
                break;
            default:
                printf("Opção inválida. Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}
