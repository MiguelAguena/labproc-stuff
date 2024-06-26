#include <stdio.h>
#include <stdlib.h>

typedef struct {
   int dia, mes, ano; 
} data;

int main(){
    data *d;

    /*Aloca memória para 2 datas*/
    d = (data *)malloc(2 * sizeof(data));

    d[0].dia = 25; d[0].mes = 6; d[0].ano = 2024;
    d[1].dia = 26; d[1].mes = 6; d[1].ano = 2024;

    /*Realoca para 4 datas*/
    d = (data *)realloc(d, 4 * sizeof(data));

    d[2].dia = 27; d[2].mes = 6; d[2].ano = 2024;
    d[3].dia = 28; d[3].mes = 6; d[3].ano = 2024;

    // Liberar a memória alocada
    free(d);
    return 0;
}