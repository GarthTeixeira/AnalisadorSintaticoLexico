package org.example;

import java.util.ArrayList;
import java.util.List;

public class ListaErros {

    private List<Erro> erros = null;

    public ListaErros() {
        this.erros = new ArrayList<Erro>();
    }

    //Usado quando sabemos de fato a linha e coluna exata
    public void defineErro(int linha, int coluna, String texto) {
        Erro e = new Erro(linha, coluna, texto);
        this.erros.add(e);
    }

    //sobrecarga do metodo defErro. Normalmente chamado pela syntax_erro() do parser
    public void defineErro(int linha, int coluna) {
        Erro e = new Erro(linha, coluna);
        this.erros.add(e);
    }

    /*
     * Adiciona o texto no primeiro erro sem descricao
     * Ou seja, naqueles erros que o syntax_error() preencheu o local
     */
    public void defineErro(String texto) {
        for (Erro e: this.erros){
            if (e.getTexto() == null) {
                e.setTexto(texto);
                return;
            }
        }
    }

    /**
     * Imprime erro por erro
     */
    public void dump() {
        for (Erro e: this.erros) {
            e.imprime();
        }
    }

    public boolean hasErros(){
        if(this.erros.size() > 0){
            return true;
        }else{
            return false;
        }
    }


}