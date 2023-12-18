package org.example;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class Erro {

    private int linha, coluna;
    private String texto;

    //Sobrecarga do construtor
    public Erro(){
        this.linha = -1;
        this.coluna = -1;
        this.texto = "";
    }

    //Sobrecarga do construtor
    public Erro(int linha, int coluna, String texto) {
        this.linha = linha;
        this.coluna = coluna;
        this.texto = texto;
    }

    //Sobrecarga do construtor
    public Erro(int linha, int coluna) {
        this.linha = linha;
        this.coluna = coluna;
        this.texto = null;//"Erro não definido";
    }

    public static void printToFile(String message, String filePath) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(message);
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Erro ao imprimir mensagem no arquivo: " + e.getMessage());
        }
    }

    public void imprime(String outputFilePath){
        String aux = "";
        aux =  "linha:" + this.linha +", coluna:" + this.coluna + ", ";

        if(this.texto == null)
            aux += " erro indefinido!";
        else
            aux += this.texto;

        System.out.println(aux);
    }

    public String joinErroToFile(String buffer){
        String aux = buffer;
        aux +=  "linha:" + this.linha +", coluna:" + this.coluna + ", ";

        if(this.texto == null)
            aux += " erro indefinido!";
        else
            aux += this.texto;

        aux += "\n";
        return aux;
    }


    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }

}
