package org.example;

import java.nio.file.Paths;

public class GeraALex {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/src/main/java/org/example/";

        String file[] = {rootPath + subPath + "scanner.lex"};

        jflex.Main.main(file);

    }

}