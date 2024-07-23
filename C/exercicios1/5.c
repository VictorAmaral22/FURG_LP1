#include <stdio.h>
#include <string.h>

int contarOcorrencias(char *frase, char *palavra) {
    int ocorrencias = 0;
    int tamanhoFrase = strlen(frase);
    int tamanhoPalavra = strlen(palavra);

    for (int i = 0; i <= tamanhoFrase - tamanhoPalavra; i++) {
        if (strncmp(&frase[i], palavra, tamanhoPalavra) == 0) {
            ocorrencias++;
        }
    }

    return ocorrencias;
}

int main() {
    char frase[100];
    char palavra[20];

    printf("Digite a frase: ");
    fgets(frase, 100, stdin);
    frase[strcspn(frase, "\n")] = '\0';

    printf("Digite a palavra: ");
    scanf("%s", palavra);

    int ocorrencias = contarOcorrencias(frase, palavra);

    printf("Temos que a palavra %s ocorre %d vezes na frase.\n", palavra, ocorrencias);

    return 0;
}
