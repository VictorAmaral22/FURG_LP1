# include <stdio.h>

int main() {
    int n, i;
    printf("\nListagem de n números ímpares\n");
    printf("\nDigite um inteiro nao-negativo: ");
    scanf("%d", &n); /* inicializacoes */
    
    for (i = 1; i <= n; i++){
        if (i % 2 != 0){
            printf("%d ", i);
        }
    }
    printf("\n");

    return 0;
}