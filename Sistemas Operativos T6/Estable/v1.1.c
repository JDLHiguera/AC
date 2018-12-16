#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#define E "ERROR!"
/*
Actualizado con:

*Modularizado

*Menu

*Ahora hay varias formas de responder el test:
1-Como en la V1: A saco con todas las preguntas
2-Por tramos. Existe
//Añadir: Función que cuenta el número de preguntas en el documento
//Añadir: Función que permite comenzar desde cierta pregunta
//Añadir: Convertir el MAIN en un procedimiento

*/

void op1();
void op2();
void ins();
void cre();
int cuenta(); //Contador de preguntas
                //Pasa: Nombre del fichero Devuelve: Número de preguntas
int main()
{
    int op=1;


    while(op!=0)
    {
        printf("\n%c%cMENU%c%c\n",254,254,254,254);
        printf("\nIntroduce tu seleccion:\n");
        printf("\n0=Salir\n1=Responder al test completo\n2=Test por partes\n3=Creditos\n---> ");
        scanf("%d",&op);
        if(op!=0)
        {
            switch(op)
            {
                case 1:op1();break;
                case 2:op2();break;
                case 3:cre();break;
            }
        }
    }


    system("pause");
    return 0;
}

void cuenta()
{
    int
}
//Responder a todas las preguntas con el unico limite
void op1()
{
    int max=0,i,sel,ok=0;
    char buffer,respuesta;
    FILE *pf;
    pf=fopen("oge.txt","r");
    if(pf==NULL)
    {
        printf("****\nNo se pudo abrir el archivo op1. Asegurate de que se encuentra en la misma carpeta que este ejecutable.\n****");
        fclose(pf);
    }
    else
    {
        printf("\nIntroduce el numero de preguntas que quieras responder: ");
        scanf("%d",&max);
        while(max<1 || max>2000)
        {
            printf("%s",E);
            printf("\nCuantas preguntas quieres responder? (desde 1 a ~500): ");
            scanf("%d",&max);
        }

        for(i=0;i<max;i++)
        {
            printf("\n%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22);
            printf("%c PREGUNTA %d DE %d\n%c ACIERTOS: %d\n\n",4,i+1,max,4,ok);
            //PASO 1: Imprime el título

            printf("%c Fichero: ",16);
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }
            printf("\n%c Titulo: ",16);
            //Titulo
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }
            //Opciones y preg 1
            printf("\n%c Opciones: \n",16);
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }
            //Preg 2
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }
            //Preg 3
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }
            //Preg 4
            buffer='a';
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
                printf("%c",buffer);
            }

            printf("\n%c Tu respuesta: ",16);
            fflush(stdin);
            scanf("%c",&respuesta);
            while(respuesta!='A' && respuesta!='B' && respuesta!='C' && respuesta!='D')
            {
                printf("\n%c Tu respuesta [Letra mayuscula!]: ",16);
                fflush(stdin);
                scanf("%c",&respuesta);
            }
            //RESPUESTA. Almacena la ultima de las 7 lineas
            buffer=fgetc(pf);
            if(buffer==respuesta)
            {
                printf("\n%c Efectivamente, %c es la respuesta correcta.\n",16,respuesta);
                ok++;
            }
            else
            {
                printf("\n%c Vaya, la respuesta correcta era la %c.\n",16,buffer);
            }
            //Transición a la siguiente pregunta. "Hace un enter"
            while(buffer!='\n')
            {
                fscanf(pf,"%c",&buffer);
            }

        }
        fclose(pf);
    }
}



void op2()
{
    int max=0,i,sel,ok=0,op=1;
    char buffer,respuesta,archivo[6];


    while(op!=0)
    {
        ok=0;
        printf("\n0=Volver al menu\n1=Test 1\n2=Test 2\n3=Test 3\n4=Test 4\n5=Test 5\n6=Test 6\n--->");
        scanf("%d",&op);
        if(op!=0)
        {
            switch(op)
            {
                case 1:strcpy(archivo,"a.txt");break;
                case 2:strcpy(archivo,"b.txt");break;
                case 3:strcpy(archivo,"c.txt");break;
                case 4:strcpy(archivo,"d.txt");break;
                case 5:strcpy(archivo,"e.txt");break;
                case 6:strcpy(archivo,"f.txt");break;

            }




        FILE *pf;
        pf=fopen(archivo,"r");
        if(pf==NULL)
        {
            printf("****\nError.\n****");
            fclose(pf);
        }
        else
        {
            printf("\nIntroduce el numero de preguntas que quieras responder: ");
            scanf("%d",&max);
            while(max<1 || max>2000)
            {
                printf("%s",E);
                printf("\nCuantas preguntas quieres responder? (desde 1 a ~500): ");
                scanf("%d",&max);
            }

            for(i=0;i<max;i++)
            {
                printf("\n%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22);
                printf("%c PREGUNTA %d DE %d\n%c ACIERTOS: %d\n\n",4,i+1,max,4,ok);
                //PASO 1: Imprime el título

                printf("%c Fichero: ",16);
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }
                printf("\n%c Titulo: ",16);
                //Titulo
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }
                //Opciones y preg 1
                printf("\n%c Opciones: \n",16);
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }
                //Preg 2
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }
                //Preg 3
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }
                //Preg 4
                buffer='a';
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                    printf("%c",buffer);
                }

                printf("\n%c Tu respuesta: ",16);
                fflush(stdin);
                scanf("%c",&respuesta);
                while(respuesta!='A' && respuesta!='B' && respuesta!='C' && respuesta!='D')
                {
                    printf("\n%c Tu respuesta [Letra mayuscula!]: ",16);
                    fflush(stdin);
                    scanf("%c",&respuesta);
                }
                //RESPUESTA. Almacena la ultima de las 7 lineas
                buffer=fgetc(pf);
                if(buffer==respuesta)
                {
                    printf("\n%c Efectivamente, %c es la respuesta correcta.\n",16,respuesta);
                    ok++;
                }
                else
                {
                    printf("\n%c Vaya, la respuesta correcta era la %c.\n",16,buffer);
                }
                //Transición a la siguiente pregunta. "Hace un enter"
                while(buffer!='\n')
                {
                    fscanf(pf,"%c",&buffer);
                }

            }
            fclose(pf);
        }
        }


    }


}
void ins()
{

}
void cre()
{
    printf("%c%c%c%c%c%c\n",22,22,22,22,22,22);
    printf("%c Normalizacion de preguntas:\n%c Francisco Javier Lara Escobar\n",21,16);
    printf("%c Miguel Afan Espinosa\n%c Joaquin Sanchez Sanchez\n",16,16);
    printf("\n%c Codigo:\n%c Ernesto Wulff Olea\n\n25 de Junio de 2014, V1.1\n",21,16);
    printf("%c%c%c%c%c%c\n",22,22,22,22,22,22);

}
