# include <stdio.h>

int main() {
    int n, i, nfat;
    printf("\nCalculo do fatorial de um numero\n");
    printf("\nDigite um inteiro nao-negativo: ");
    scanf("%d", &n); /* inicializacoes */
    nfat = 1;
    for (i = 2; i <= n; i++) {
        nfat = nfat * i;
    }
    printf("O valor de %d!= %d\n", n, nfat);
    return 0;
}