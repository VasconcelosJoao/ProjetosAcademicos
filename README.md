# Repositório de Projetos Acadêmicos

Este repositório foi criado com o objetivo de centralizar, preservar e organizar os projetos desenvolvidos por **João Lucas Vasconcelos** ao longo de sua trajetória acadêmica, reunindo produções realizadas durante a graduação em **Engenharia de Software pela Universidade de Brasília (UnB)** e durante a graduação em **Big Data e Business Intelligence pelo IESB**.

A proposta deste espaço é manter, em um único repositório, o conjunto dos trabalhos acadêmicos desenvolvidos nessas formações, permitindo uma visualização mais estruturada da trajetória técnica, dos experimentos, das entregas e da evolução dos projetos construídos em diferentes disciplinas e contextos acadêmicos.

Além disso, esta organização também contribui para manter o perfil **[@VasconcelosJoao](https://github.com/VasconcelosJoao)** mais limpo e objetivo, evitando a dispersão de múltiplos repositórios acadêmicos independentes e concentrando esse histórico em um único local, de maneira mais organizada e fácil de consultar.

## Finalidade do repositório

Este repositório tem como principais objetivos:

- reunir projetos acadêmicos em um único espaço;
- preservar entregas desenvolvidas ao longo das graduações;
- facilitar a consulta e a navegação entre os trabalhos;
- manter o perfil GitHub mais organizado, separando projetos acadêmicos de outros repositórios pessoais, profissionais ou experimentais;
- permitir, quando necessário, a recuperação individual dos repositórios originais para fins de verificação de histórico, commits, branches, issues e outros metadados.

## Estrutura dos projetos

Os projetos aqui reunidos foram originalmente mantidos como repositórios independentes no GitHub. Posteriormente, foram agrupados neste repositório principal para fins de organização e centralização.

Para evitar conflitos entre repositórios Git aninhados, os diretórios `.git` internos podem ser temporariamente renomeados para `.git_old`. Isso faz com que cada projeto deixe de ser interpretado localmente como um repositório independente, passando a funcionar como uma pasta comum dentro deste repositório agregador.

Quando necessário, esses repositórios podem ser restaurados localmente, com recuperação de seu histórico Git original.

## Scripts auxiliares

Os arquivos `scripts.sh` contêm comandos comentados utilizados para auxiliar no processo de:

- clonagem dos repositórios acadêmicos originais;
- inspeção de repositórios Git internos;
- renomeação dos diretórios `.git` para `.git_old`, a fim de incorporar os projetos a este repositório principal sem conflito de versionamento;
- restauração dos diretórios `.git_old` para `.git`, quando houver necessidade de reviver um repositório individualmente;
- reconfiguração de repositórios restaurados para novo envio ao GitHub, inclusive para fins de recuperação de histórico de commits, branches e eventual continuidade do projeto como repositório autônomo.

Em síntese, esses scripts não compõem o conteúdo acadêmico dos projetos em si, mas funcionam como ferramentas de apoio à organização, migração e eventual recuperação estrutural dos repositórios.

## Repositórios originalmente agregados

Os comandos abaixo correspondem aos projetos originalmente clonados para compor este repositório consolidado:

```bash
# git clone git@github.com:VasconcelosJoao/SistemasEmbarcados2.git
# git clone git@github.com:VasconcelosJoao/SistemasEmbarcados.git
# git clone git@github.com:VasconcelosJoao/Projeto-Final-SBD2.git
# git clone git@github.com:VasconcelosJoao/SAE-SBD2.git
# git clone git@github.com:VasconcelosJoao/LanguageLab.git
# git clone git@github.com:VasconcelosJoao/2022.2-MEI.git
# git clone git@github.com:VasconcelosJoao/2022.2-SimplesNacional.git
# git clone git@github.com:VasconcelosJoao/2023.2-OneShot.git
# git clone git@github.com:VasconcelosJoao/Cebraspe-Tracker.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-I-UNB.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-II.git
# git clone git@github.com:VasconcelosJoao/Projeto-Integrador-I.git
# git clone git@github.com:VasconcelosJoao/2024.1_G3_My_gov.git
````

## Comandos de apoio presentes nos scripts

Os comandos auxiliares utilizados no processo incluem:

```bash
# find . -mindepth 2 -type d -name ".git"

# find . -mindepth 2 -type d -name ".git" -exec bash -c 'for d; do mv "$d" "${d%/.git}/.git_old"; done' _ {} +

# find . -mindepth 2 -type d -name ".git_old" -exec bash -c 'for d; do mv "$d" "${d%/.git_old}/.git"; done' _ {} +

# mv .git_old .git
# git remote remove origin
# git remote add origin https://github.com/SEU-USUARIO/NOVO-REPO.git
# git push -u origin main
```

## Observação sobre recuperação de repositórios

Caso algum dos projetos precise voltar a existir como repositório independente, o procedimento pode ser realizado restaurando o diretório `.git` correspondente. A partir disso, o projeto recupera seu histórico Git local e pode, se necessário, ser novamente associado a um repositório remoto no GitHub.

Esse procedimento é especialmente útil para:

* auditoria de histórico de desenvolvimento;
* verificação de commits antigos;
* recuperação de branches;
* análise de estrutura original do projeto;
* nova publicação do projeto como repositório autônomo.

## Considerações finais

Este repositório funciona, portanto, como um **arquivo consolidado da trajetória acadêmica** de João Lucas Vasconcelos nas áreas de Engenharia de Software, Big Data e Business Intelligence, preservando a memória técnica dos projetos e promovendo melhor organização do portfólio no GitHub.
