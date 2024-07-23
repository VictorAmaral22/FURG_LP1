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

void adicionarProdutos () {
    printf("Adicionar produto \n");

    struct Produto novoProduto;
    novoProduto.nome = "Ball";
    novoProduto.codigo = 1;
    novoProduto.preco = 10.00;
}

void exibirProdutos () {
    printf("Exibir produto \n");
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
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:
                adicionarProdutos(&head);
                break;
            case 2:
                exibirProdutos(head);
                break;
            case 3:
                // buscarProdutoPorNome(head);
                break;
            case 4:
                // liberarLista(head);
                printf("Saindo...\n");
                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
        }
    } while (opcao != 4);

    return 0;
}