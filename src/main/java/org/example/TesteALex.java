package org.example;

import java_cup.runtime.Symbol;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.Scanner;

public class TesteALex {

    static String FILE_NAME = "teste1.txt";

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
                        lexical.next_token();
                        System.out.println(" ------- Fim da analise do arquivo: " + fileName + " ------- ");
                    }
                } else {
                    teste = readFileReturnString(fileNameParam);
                    AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
                    lexical.next_token();
                }
            }
        }else teste = readFileReturnString(FILE_NAME);

        return teste;
    }
    public static void main(String[] args) throws IOException{

        String teste = getTesteContent(args);
        AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));


        Symbol sym = lexical.next_token();

        while (sym.sym != 0) {
            sym = lexical.next_token();
        }

    }


}