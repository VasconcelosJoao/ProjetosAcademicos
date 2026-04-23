# README do Repositório SAE-SBD2

## Descrição

O repositório **SAE-SBD2** contém um programa em C que permite ao usuário fazer perguntas e salvar respostas em um arquivo de texto. O programa é interativo e utiliza um arquivo de texto (`sae.txt`) para armazenar pares de perguntas e respostas. Ele é útil para quem deseja manter um registro de perguntas frequentes e suas respectivas respostas.

## Estrutura do Repositório

O repositório contém os seguintes arquivos:

- **prog**: O arquivo binário gerado a partir do código fonte.
- **sae.c**: O código fonte do programa em C.
- **sae.txt**: O arquivo de texto onde as perguntas e respostas são armazenadas.

## Funcionalidades

- **Salvar Perguntas e Respostas**: O programa permite que o usuário insira uma pergunta e, caso a resposta não esteja disponível, o usuário pode fornecer uma nova resposta, que será salva no arquivo `sae.txt`.
- **Buscar Respostas**: O usuário pode fazer perguntas e o programa tentará encontrar a resposta correspondente no arquivo. Se a resposta não for encontrada, o usuário é solicitado a fornecê-la.
- **Interface Interativa**: O programa é executado em um loop, permitindo que o usuário faça várias perguntas até que decida sair digitando "exit".

## Como Usar

1. **Compilação**: Para compilar o programa, utilize o seguinte comando no terminal:
   ```bash
   gcc -o prog sae.c
   ```

2. **Execução**: Execute o programa com o comando:
   ```bash
   ./prog
   ```

3. **Interação**:
   - Digite uma pergunta e pressione Enter.
   - Se a resposta estiver disponível, ela será exibida. Caso contrário, você poderá fornecer uma nova resposta.
   - Para sair do programa, digite `exit`.

## Detalhes Técnicos

- O programa utiliza uma estrutura chamada `QA` para armazenar pares de perguntas e respostas.
- O arquivo `sae.txt` é criado automaticamente se não existir, e as perguntas e respostas são armazenadas no formato:
  ```
  pergunta:"[pergunta]"
  resposta:"[resposta]"
  ```
- As perguntas devem ser finalizadas com uma quebra de linha para serem corretamente processadas.

---
