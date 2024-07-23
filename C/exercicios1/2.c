# include <stdio.h>

int main() {
    int n, i, divisors = 2;
    printf("\nVerificar se um numero é primo\n");
    printf("\nDigite um inteiro nao-negativo: ");
    scanf("%d", &n); /* inicializacoes */
    
    if (n == 1){
        printf("%d não é primo\n", n);
        return 0;
    }

    if (n == 2){
        printf("%d é primo\n", n);
        return 0;
    }

    for (i = 2; i <= n-1; i++) {
        if (n % i == 0) {
            divisors++;
        }
    }

    if (divisors > 2) {
        printf("%d não é primo\n", n);
    } else {
        printf("%d é primo\n", n);
    }

    return 0;
}