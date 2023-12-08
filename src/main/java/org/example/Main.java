package org.example;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Scanner;

public class Main {

    static String FILE_NAME = "teste2.txt";

    static String [] allFilesNames = {"teste1.txt", "teste2.txt", "teste3.txt", "teste4.txt", "teste5.txt", "teste6.txt", "teste7.txt", "teste8.txt", "teste9.txt"};

    public static String readFileReturnString(String fileName) throws IOException {
        try (InputStream inputStream = Main.class.getClassLoader().getResourceAsStream(fileName)){


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
        teste = readFileReturnString(FILE_NAME);
        return teste;
    }
    public static void main(String[] args) throws IOException {

        String teste = getTesteContent(args);

        try {
            AnalisadorLexico lexical = new AnalisadorLexico(new StringReader(teste));
            Parser parser = new Parser(lexical);

            Object result = parser.parse().value;


        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
