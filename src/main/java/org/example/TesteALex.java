package org.example;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.Scanner;

public class TesteALex {

    static String FILE_NAME = "teste4.txt";

    static String [] allFilesNames = {"teste1.txt", "teste2.txt", "teste3.txt", "teste4.txt", "teste5.txt", "teste6.txt", "teste7.txt", "teste8.txt", "teste9.txt"};
    public static String readFileReturnString(String fileName) throws IOException {
        try (InputStream inputStream = TesteALex.class.getClassLoader().getResourceAsStream(fileName)){


            Scanner scanner = new Scanner(inputStream);

            StringBuilder conteudo = new StringBuilder();

            while (scanner.hasNextLine()) {
                conteudo.append(scanner.nextLine()).append("\n");
            }

            scanner.close();

            return conteudo.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileName;
    }

    public static String getTesteContent(String[] args) throws IOException {
        String teste = "";
        if (args.length > 0) {
            String fileNameParam = args[0];
            if (fileNameParam != null && !fileNameParam.isEmpty()) {
                if(fileNameParam.equals("all")) {
                    for (String fileName : allFilesNames) {
                        teste = readFileReturnString(fileName);
                        System.out.println(" ------- Analisando o arquivo: " + fileName + " ------- ");
                        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
                        lexical.yylex();
                        System.out.println(" ------- Fim da analise do arquivo: " + fileName + " ------- ");
                    }
                } else {
                    teste = readFileReturnString(fileNameParam);
                    AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
                    lexical.yylex();
                }
            }
        }else teste = readFileReturnString(FILE_NAME);

        return teste;
    }
    public static void main(String[] args) throws IOException{

        try {

            System.out.println("Gerando Analisador Lexico...");
            GeraALex.main(args);
        }
        catch (Exception e) {
            System.out.println("Erro ao gerar analisador lexico... por favor consulte o arquivo scanner.lex para" +
                    " verificar se o mesmo esta correto,\n" +
                    " caso esteja,delete o aquivo 'AnalisadorLexico' e tente novamente.");
        }
        System.out.println("Analisador Lexico Gerado com Sucesso! \nAnalisando Lexicamente...");
        String teste = getTesteContent(args);
        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
        lexical.yylex();

    }


}