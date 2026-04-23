#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 600

typedef struct
{
    char question[MAX_SIZE];
    char answer[MAX_SIZE];
} QA;

void saveQA(QA qa)
{
    FILE *file = fopen("sae.txt", "a");
    if (file == NULL)
    {
        printf("Não foi possível abrir o arquivo.\n");
        return;
    }
    fprintf(file, "pergunta:\"%s\"\nresposta:\"%s\"\n", qa.question, qa.answer);
    fclose(file);
}

void ensureFileExists()
{
    FILE *file = fopen("sae.txt", "a");
    if (file == NULL)
    {
        printf("Não foi possível criar o arquivo.\n");
        return;
    }
    fclose(file);
}

char *findAnswer(char *question)
{
    ensureFileExists();
    FILE *file = fopen("sae.txt", "r");
    if (file == NULL)
    {
        printf("Não foi possível abrir o arquivo.\n");
        return NULL;
    }
    char line[MAX_SIZE];
    char format[MAX_SIZE];
    sprintf(format, "pergunta:\"%s\"", question);
    while (fgets(line, sizeof(line), file))
    {
        line[strcspn(line, "\n")] = 0; // remove newline character
        if (strcmp(line, format) == 0)
        {
            if (fgets(line, sizeof(line), file))
            {                                  // this is the answer
                line[strcspn(line, "\n")] = 0; // remove newline character
                char *answer = strchr(line, '\"') + 1;
                answer[strlen(answer) - 1] = '\0'; // remove the last quote
                fclose(file);
                return strdup(answer);
            }
        }
    }
    fclose(file);
    return NULL;
}

int main()
{
    char question[MAX_SIZE];
    char *answer = NULL;
    do
    {
        printf("Digite a pergunta: ");
        if (!fgets(question, sizeof(question), stdin))
        {
            break;
        }
        question[strcspn(question, "\n")] = 0; // remove newline character

        if (strcmp(question, "exit") == 0)
        {
            break;
        }

        free(answer); // free the previous answer
        answer = findAnswer(question);
        if (answer == NULL)
        {
            printf("Não encontrada, forneça a resposta: ");
            char newAnswer[MAX_SIZE];
            if (!fgets(newAnswer, sizeof(newAnswer), stdin))
            {
                break;
            }
            newAnswer[strcspn(newAnswer, "\n")] = 0; // remove newline character

            QA qa;
            strncpy(qa.question, question, sizeof(qa.question));
            strncpy(qa.answer, newAnswer, sizeof(qa.answer));
            saveQA(qa);

            printf("A resposta foi salva.\n");
            printf("Pressione qualquer tecla para continuar...");
            getchar();
            system("clear");
        }
        else
        {
            printf("A resposta é: %s\n\n", answer);
            printf("Pressione qualquer tecla para continuar...");
            getchar();
            system("clear");
        }
    } while (1);

    free(answer); // free the last answer
    return 0;
}