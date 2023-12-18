# Analisador Sintatico e Léxico

## Motivação

Projeto de um compilador para a disciplina ECOI26

## Requisitos

- Java 8
- Apache Maven

## Como executar

1. Pela IDE IntelliJ onde basta mudar no aquivo ``Main`` o valor da variável ``FILE_NAME`` para um dos respectivos testes, exemplo:
```java
static String FILE_NAME = "testeX.txt"
```
2. Executando o ```.jar``` pelo terminal, passando o nome de um dos arquivos de teste como argumento, primeiro execute o maven com o comando:
```bash
 mvn clean package
```
  Em seguida basta rodar o comando usando um dos nomes dos aquivos:
```bash
 java -jar target/analisador-sintatico-jar-with-dependencies.jar
```
