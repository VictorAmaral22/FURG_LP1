# include <stdio.h>

float farhenheitToCelcius (float temp) {
    float res = ((temp-32)*5)/9;
    return res;
}

int main() {
    float n, result;
    printf("\nConversão Farhenheit => Celsius\n");
    printf("\nDigite um número float: ");
    scanf("%f", &n); /* inicializacoes */
    
    result = farhenheitToCelcius(n);

    printf("Conversão %f => %f\n", n, result);
    return 0;
}