#include <stdbool.h>

int main () {
    // Para criar variáveis é só informar o tipo seguido do nome da variável
    int number = 1;
    float dolar = 12.99;
    bool ready = false;
    char letter = 'A';
    
    // Estruturas condicionais
    if (number >= 1)
    {
        printf("number greater/iqual than 1");
    }

    int contador = 0;
    while (contador <= 10)
    {
        printf("%d ", contador); //Executando um comando dentro do laço
        
        contador++; //atualizando a variável de controle
    } 
}