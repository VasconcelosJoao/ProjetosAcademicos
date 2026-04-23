# Documento de Visão

## Histórico de revisão

| Data       | Versão | Descrição                         | Autor(es)                                                  |
| ---------- | ------ | --------------------------------- | ---------------------------------------------------------- |
| 15/07/2022 | 0.1    | Abertura do documento de Visão    | [Matheus Henrick](https://github.com/MatheusHenrickSantos) |
| 16/07/2022 | 0.2    | Adição dos tópicos 1, 2 e 3       | [Matheus Henrick](https://github.com/MatheusHenrickSantos) |
| 17/07/2022 | 0.3    | Adição dos tópicos 4, 5 e 6       | [Matheus Henrick](https://github.com/MatheusHenrickSantos) |
| 24/07/2022 | 1.0    | Adição do tópico 7                | [Matheus Henrick](https://github.com/MatheusHenrickSantos) |
| 25/07/2022 | 1.1    | Atualização do tópico 7           | [Abdul Hannan](https://github.com/hannanhunny01)           |
| 12/09/2022 | 1.2    | Atualização e revisão ortográfica | [Matheus Henrick](https://github.com/MatheusHenrickSantos) |

## Introdução

### Objetivo

O objetivo deste documento é detalhar as etapes do desenvolvimento do projeto Cebraspe Tracker, definir o escopo do produto, os requisitos funcionais e não funcionais e os problemas enfrentados na execução.

### Escopo

Cebaspre tracker é a solução perfeita para estudantes que estão em processo seletivo tanto para ajudar as pessoas que perdem sua vaga por falta de entendiento sobre o processo seletivo quanto para as pessoas que sofrem de uma ansiedade pesada, para poder tranquilizá-las e tirar das costas dessas pessoas o peso de ficar atualizando todos os dias a página do concurso público PAS.

### Definições, acrônimos e abreviações

| Abreviação | Significado                                          |
| ---------- | ---------------------------------------------------- |
| _UnB_      | Universidade de Brasília                             |
| _FGA_      | Faculdade UnB Gama                                   |
| _MDS_      | Métodos de Desenvolvimento de Software               |
| _PAS_      | Programa de Avaliação Seriada                        |

## Posicionamento

### Oportunidade de Negócios

O projeto Cebraspe Tracker surge como uma forma de atacar um problema muito comum em pessoas que buscam entrar na faculdade, que é a perda de chamadas no processo seletivo, o que acaba por gerar um longo processo de preenchimento de vagas e interrompe o sonho de muita gente.

### Descrição do Problema

| O problema é | Que afeta | Cujo impacto é | Uma boa solução seria |
| ------------ | --------- | -------------- | --------------------- |
| A perda de chamadas nos processos seletivos | Estudantes em busca de uma vaga na universidade | Estudantes terem o seu sonho de entrar em uma universidade adiado ou encerrado | Notificar os estudantes que foram chamados para o processo seletivo |

### Posição do Produto

Destinado a pessoas que estão à espera do resultado do processo seletivo, a fim de evitar que estes percam uma chamada e poupá-los do trabalho de ter que atualizar a página do Cebraspe a todo instante.

## Descrição dos Envolvidos e dos Usuários

### Resumo dos envolvidos

| Nome                                  | Descrição                                  | Responsabilidades                 |
| ------------------------------------- | ------------------------------------------ | --------------------------------- |
| Orientadores                          | Professora da disciplina de MDS            | Orientar e guiar a equipe         | 
| Equipe de desenvolvimento de Software | Estudantes da disciplina de MDS da UnB FGA | Desenvolver e gerenciar o projeto |

### Descrição dos Usuários

| Nome                                     | Responsabilidades                                        |
| ---------------------------------------- | -------------------------------------------------------- |
| Estudantes em processo seletivo          | Cadastrar-se na plataforma                               | 
| Equipe de desenvolvimento de Software    | Documentar, desenvolver, testar e implementar o software |
| Professora da disciplina de MDS          | Orientar e avaliar o trabalho realizado pela equipe      |

### Principais Necessidades dos Usuários e dos Envolvidos

| Usuário | Necessidade | Solução Atual | Solução Proposta |
| ------- | ----------- | ------------- | ---------------- |
| Estudantes | Meio de notificar sobre chamadas em andamento | Verificar constantemente a página do Cebraspe | Enviar notifiação por e-mail e WhatsApp |

### Ambiente dos Usuários

Os usuários poderão utilizar a aplicação por meio de navegadores web.

### Perfis dos Envolvidos

#### Equipe de Desenvolvimento de Software

| Representantes | Tipo | Responsabilidade | Critério de sucesso | Envolvimento |
| -------------- | ---- | ---------------- | ------------------- | ------------ |
| Abdul Hannan, Asafe Salumiel Souza, Gabriel De Souza Fonseca Ribeiro, João Lucas Pinto Vas, Matheus Henrick Dutra | Estudantes de MDS na UnB FGA | Criar e manter documentos; Desenvolver e testar o software | Completar o projeto proposto dentro do período estipulado e atendendo à todos os requisitos | Alto |

#### Avaliadores

| Representantes | Tipo                         | Responsabilidade                    | Critério de sucesso                                         | Envolvimento |
| -------------- | ---------------------------- | ----------------------------------- | ----------------------------------------------------------- | ------------ |
| Carla Rocha    | Professora de MDS na UnB FGA | Avaliar qualidade do projeto criado | Transmitir conhecimento sobre projetos de software em grupo | Baixo        |

### Perfis dos Usuários

| Representantes | Tipo | Responsabilidade | Critério de sucesso | Envolvimento |
| -------------- | ---- | ---------------- | ------------------- | ------------ |
| Interessados em ingressar na universidade | Estudantes em processo seletivo | Cadastrar-se na plataforma | Ser notificado de que seu nome consta na lista de chamada | Baixo |

## Visão Geral do Produto

### Perspectiva do Produto

O Projeto visa ser um facilitador do uso da plataforma do Cebraspe, dando segurança e praticidade aos alunos que estão à espera de uma chamada em processos seletivos. Para isso será utilizado a lista que será disponibilizada pelo próprio site, para que se possa realizar uma busca pelo nome de forma automatizada e notificar o usuário via e-mail e WhatsApp.

### Resumo das capacidades

| Benefício para o Usuário | Recursos de suporte |
| ------------------------ | ------------------- |
| Facilidade em se cadastrar | A aplicação disponibiliza uma interface com um campo para preenchimento do nome, e-mail e telefone |
| Segurança na busca pelo nome | A aplicação notificará o estudante em caso deste ser chamado em um processo seletivo |

### Funções do Produto

O projeto está encarregado de notificar o usuário caso o nome conste na lista de chamada, dando segurança e acabando com a necessidade de uma busca manual.

### Suposições e dependências

- O usuário deverá ter um meio de se conectar à internet para acessar a aplicação.
- O usuário deverá ter um e-mail cadastrado na plataforma.

## Recursos do Produto

Os usuários interessados no projeto terão acesso ao seguinte recurso:
- Ser notificado via e-mail e WhatsApp, caso seja chamado.

## Restrições

Listagem de restrições externas e outras dependências:

- Ter um computador.
- Ter conexão à internet.
- Ter um e-mail cadastrado.

### Restrições de Implementação

O sistema será implementado utilizando 3 principais tecnologias, sendo elas Django para o backend, webcrawler para leitura do html e React.js para o frontend.

### Restrições externas

Dentre as restrições externas as que mais irão influenciar são a falta de experiência com as tecnologias, além de possíveis transtornos entre a equipe de desenvolvimento.

### Restrições de Design

Toda a interação com o software deve ocorrer de forma a não causar dúvida no usuário. Para isso será necessário apenas que o usuário informe o nome, e-mail e telefone.

### Restrições de Confiabilidade

Visando uma maior manutenibilidade do projeto pela comunidade, os desenvolvedores têm o comprometimento de manter uma cobertura de testes mínima de 90%.

## Requisitos do Produto

### Requisitos funcionais

| Identificador | Requisito | Prioridade |
| ------------- | --------- | ---------- |
| RF1           | Deve ser possível realizar o CRUD de Usuário | Alta |
| RF2           | O Aplicativo deve ter um Sistema para Login | Alta |
|RF3            | Deve ter uma opção que permita o usuário escolher se quer receber apenas notificações sobre chamadas ou todas as atualizações no site do SubPrograma/PAS | Média |
| RF4           | Deve ter um recurso para enviar mensagem ao usuário se o nome dele for encontrado na chamada do Cebraspe/PAS | Alta |
| RF5           | O nome deve ser retirado da pool de inscritos, caso ele tenha sido chamado | Média |
| RF6           | Se houver nova chamada de convocados o sistema devera notificar o usuários por e-mail ou sms/whatsapp | Média |
| RF7           | O primeiro web crawler deverá ler o html, identificar e salvar o link das consultas online no banco de dados | Alta |
| RF8           | O segundo web crawler deverá ser capaz de pesquisar todos os nomes cadastrados e utilizá-los como parâmetro para busca nos chamadas do subprograma do PAS | Alta |
| RF9           | O segundo crawler deve pesquisar o nome do usuário registrado na barra de pesquisa da chamada/PAS, verificar no html e, se encontrar o nome da pessoa, atualizar no sistema | Alta |
| RF10           | Para subprogramas do PAS que estão tendo chamada de convocados ou terão no futuro, deve ter um crawler implementado, que deve funcionar de forma autônoma | Média |
| RF11           | Deve ter um crawler que roda todos os dias para verificar se há uma nova atualização no site | Média |
| RF12           | Se houver atualização no edital do PAS, o primeiro crawler deve rodar para encontrar o novo link para a nova chamada | Alta |


### Requisitos não-funcionais

| Identificador | Requisito | Prioridade |
| ------------- | --------- | ---------- |
| RNF1          | A interação com o usuário deve ser feita por meio de interface gráfica | Alta |
| RNF2          | O software será desenvolvido para ambiente web | Alta |
| RNF3          | O software deverá ser desenvolvido utilizando React.js, HTML, CSS3 e TypeScript para o Frontend | Alta |
| RNF4          | O software deverá ser desenvolvido utilizando React express | Alta |
| RNF5          | O software deverá ser desenvolvido utilizando o Mongodb como banco de dados | Alta |
| RNF6          | O software deverá ser desenvolvido utilizando Scrapy e MIDDLEWARE com SELENIUM E SPLASH para o web crawler | Alta |
| RNF7          | O software deverá ser desenvolvido utilizando a arquitetura MVT | Alta |
| RNF8          | O desenvolvimento da aplicação será containerizado com o Docker | Alta |
