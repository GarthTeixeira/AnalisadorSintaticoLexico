package org.example;
import java_cup.runtime.Symbol;

%%

%class AnalisadorLexico
%cupsym TiposDeToken
%cup
%line
%column

%{


      private ListaErros listaErros;

      public AnalisadorLexico(java.io.StringReader in, ListaErros listaErros) {
          this(in);
          this.listaErros = listaErros;
      }

      public ListaErros getListaErros() {
        return listaErros;
      }

      public void defineErro(int linha, int coluna, String texto) {
      		listaErros.defineErro(linha, coluna, texto);
      }


      	public void defineErro(int linha, int coluna) {
      		listaErros.defineErro(linha, coluna);
      	}


      	public void defineErro(String texto) {
      		listaErros.defineErro(texto);
      	}



      private Symbol addToken(int tokenType,String value, String vaueType, int line, int column) {
        System.out.print(vaueType + yytext() + " linha:" + String.valueOf(line) + ", coluna:"+ String.valueOf(column) +" \n");
        return new Symbol(tokenType,line,column, value);
      }

       private Symbol addToken(int tokenType,Integer value, String vaueType, int line, int column) {
              return new Symbol(tokenType,line,column, value);
           }

       private Symbol addToken(int tokenType,Float value, String vaueType, int line, int column) {
                     return new Symbol(tokenType,line,column, value);
                  }
%}

letter = [A-Za-z]
digit = [0-9]
space = [ \t\n\r\f]
identifier = {letter}({letter}|{digit})*
constant = {digit}({digit})*
optionalFractional = ("."{constant})?
floatConstant = {constant}{optionalFractional}
comment = "%"[^]*"%"
program = "program"
declare = "declare"
read = "read"
write = "write"
begin = "begin"
end = "end"
integer = "integer"
decimal = "decimal"
if = "if"
then = "then"
else = "else"
do = "do"
while = "while"
for = "for"
to = "to"
not = "not"
mod = "mod"
and = "and"
or = "or"
less = "<"
great = ">"
equal = "="
different = "<>"
lessEqual = "<="
greatEqual = ">="
assign = ":="
add = "+"
minus = "-"
mult = "*"
part = "/"
comma = ","
leftParenthesis = "("
rightParenthesis = ")"
semicolon = ";"
doubleQuote = "\""
literal = {doubleQuote}[^\"]*{doubleQuote}
rightShift = ">>"
leftShift = "<<"
unsignedRightShift = ">>>"
unsignedLeftShift = "<<<"
interrogation = "?"
colon = ":"


%%

{space} {}
{comment} {System.out.print("Comentário "+ yytext() + "\n");}
{program} {return addToken(TiposDeToken.PALAVRA_RESERVADA_PROGRAM, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{declare} {return addToken(TiposDeToken.PALAVRA_RESERVADA_DECLARE, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{read} {return addToken(TiposDeToken.PALAVRA_RESERVADA_READ, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{write} {return addToken(TiposDeToken.PALAVRA_RESERVADA_WRITE, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{begin} {return addToken(TiposDeToken.PALAVRA_RESERVADA_BEGIN, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{end} {return addToken(TiposDeToken.PALAVRA_RESERVADA_END, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{integer} {return addToken(TiposDeToken.PALAVRA_RESERVADA_INTEGER, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{decimal} {return addToken(TiposDeToken.PALAVRA_RESERVADA_DECIMAL, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{if} {return addToken(TiposDeToken.PALAVRA_RESERVADA_IF, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{then} {return addToken(TiposDeToken.PALAVRA_RESERVADA_THEN, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{else} {return addToken(TiposDeToken.PALAVRA_RESERVADA_ELSE, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{do} {return addToken(TiposDeToken.PALAVRA_RESERVADA_DO, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{while} {return addToken(TiposDeToken.PALAVRA_RESERVADA_WHILE, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{for} {return addToken(TiposDeToken.PALAVRA_RESERVADA_FOR, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{to} {return addToken(TiposDeToken.PALAVRA_RESERVADA_TO, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{not} {return addToken(TiposDeToken.PALAVRA_RESERVADA_NOT, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{mod} {return addToken(TiposDeToken.PALAVRA_RESERVADA_MOD, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{and} {return addToken(TiposDeToken.PALAVRA_RESERVADA_AND, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{or} {return addToken(TiposDeToken.PALAVRA_RESERVADA_OR, yytext(),"Palavra Reservada " ,yyline , yycolumn);}
{less} {return addToken(TiposDeToken.OPERADOR_LESS, yytext(),"Operador " ,yyline , yycolumn);}
{great} {return addToken(TiposDeToken.OPERADOR_GREAT, yytext(),"Operador " ,yyline , yycolumn);}
{equal} {return addToken(TiposDeToken.OPERADOR_EQUAL, yytext(),"Operador " ,yyline , yycolumn);}
{different} {return addToken(TiposDeToken.OPERADOR_DIFFERENT, yytext(),"Operador " ,yyline , yycolumn);}
{lessEqual} {return addToken(TiposDeToken.OPERADOR_LESSEQUAL, yytext(),"Operador " ,yyline , yycolumn);}
{greatEqual} {return addToken(TiposDeToken.OPERADOR_GREATEQUAL, yytext(),"Operador " ,yyline , yycolumn);}
{assign} {return addToken(TiposDeToken.OPERADOR_ASSIGN, yytext(),"Operador " ,yyline , yycolumn);}
{add} {return addToken(TiposDeToken.OPERADOR_ADD, yytext(),"Operador " ,yyline , yycolumn);}
{minus} {return addToken(TiposDeToken.OPERADOR_MINUS, yytext(),"Operador " ,yyline , yycolumn);}
{mult} {return addToken(TiposDeToken.OPERADOR_MULT, yytext(),"Operador " ,yyline , yycolumn);}
{part} {return addToken(TiposDeToken.OPERADOR_PART, yytext(),"Operador " ,yyline , yycolumn);}
{comma} {return addToken(TiposDeToken.COMMA, yytext(),"Operador " ,yyline , yycolumn);}
{leftParenthesis} {return addToken(TiposDeToken.LEFT_PARENTHESIS, yytext(),"Operador " ,yyline , yycolumn);}
{rightParenthesis} {return addToken(TiposDeToken.RIGHT_PARENTHESIS, yytext(),"Operador " ,yyline , yycolumn);}
{rightShift} {return addToken(TiposDeToken.OPERADOR_RIGHT_SHIFT, yytext(),"Operador " ,yyline , yycolumn);}
{leftShift} {return addToken(TiposDeToken.OPERADOR_LEFT_SHIFT, yytext(),"Operador " ,yyline , yycolumn);}
{unsignedLeftShift} {return addToken(TiposDeToken.OPERADOR_UNSIGNED_LEFT_SHIFT, yytext(),"Operador " ,yyline , yycolumn);}
{unsignedRightShift} {return addToken(TiposDeToken.OPERADOR_UNSIGNED_RIGHT_SHIFT, yytext(),"Operador " ,yyline , yycolumn);}
{semicolon} {return addToken(TiposDeToken.SEMICOLON, yytext(),"Ponto e vírgula", yyline, yycolumn);}
{identifier} {return addToken(TiposDeToken.IDENTIFICADOR, yytext(),"Identificador " ,yyline , yycolumn);}
{constant} {
    int aux = Integer.parseInt(yytext());
    return addToken(TiposDeToken.CONSTANT, new Integer(aux),"Constante " ,yyline , yycolumn);
}
{floatConstant} {
    float aux = Float.parseFloat(yytext());
    return addToken(TiposDeToken.FLOAT_CONSTANT, new Float(aux),"Constante float " ,yyline , yycolumn);
}
{literal} {return addToken(TiposDeToken.LITERAL, yytext(),"Literal " ,yyline , yycolumn);}
{interrogation} {return addToken(TiposDeToken.INTERROGATION, yytext(),"Interrogação " ,yyline , yycolumn);}
{colon} {return addToken(TiposDeToken.COLON, yytext(),"Dois pontos " ,yyline , yycolumn);}

. {
    defineErro(yyline, yycolumn, "Erro Léxico: Caractere " + yytext() + " invalido!!!!");
    //return addToken(TiposDeToken.EOF, yytext(), "Caractere invalido!!!!", yyline, yycolumn);
}