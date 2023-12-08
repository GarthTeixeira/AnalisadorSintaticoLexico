package src;

%%

%class AnalisadorLexico
%standalone
%line
%column

%{
      TabelaDeSimbolos tabela = new TabelaDeSimbolos();

      private void addToken(TiposDeToken type,String value) {
        tabela.novaEntrada(type,value,yycolumn, yyline);
      }
%}

letter = [A-Za-z]
digit = [0-9]
space = [ \t\n\r\f]
identifier = {letter}({letter}|{digit})*
constant = {digit}({digit})*
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
equal = "=="
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



%%

{space} {}
{comment} {System.out.print("Comentário "+ yytext() + "\n");}
{program} {addToken(TiposDeToken.PALAVRA_RESERVADA_PROGRAM, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{declare} {addToken(TiposDeToken.PALAVRA_RESERVADA_DECLARE, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{read} {addToken(TiposDeToken.PALAVRA_RESERVADA_READ, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{write} {addToken(TiposDeToken.PALAVRA_RESERVADA_WRITE, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{begin} {addToken(TiposDeToken.PALAVRA_RESERVADA_BEGIN, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{end} {addToken(TiposDeToken.PALAVRA_RESERVADA_END, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{integer} {addToken(TiposDeToken.PALAVRA_RESERVADA_INTEGER, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{decimal} {addToken(TiposDeToken.PALAVRA_RESERVADA_DECIMAL, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{if} {addToken(TiposDeToken.PALAVRA_RESERVADA_IF, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{then} {addToken(TiposDeToken.PALAVRA_RESERVADA_THEN, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{else} {addToken(TiposDeToken.PALAVRA_RESERVADA_ELSE, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{do} {addToken(TiposDeToken.PALAVRA_RESERVADA_DO, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{while} {addToken(TiposDeToken.PALAVRA_RESERVADA_WHILE, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{for} {addToken(TiposDeToken.PALAVRA_RESERVADA_FOR, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{to} {addToken(TiposDeToken.PALAVRA_RESERVADA_TO, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{not} {addToken(TiposDeToken.PALAVRA_RESERVADA_NOT, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{mod} {addToken(TiposDeToken.PALAVRA_RESERVADA_MOD, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{and} {addToken(TiposDeToken.PALAVRA_RESERVADA_AND, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{or} {addToken(TiposDeToken.PALAVRA_RESERVADA_OR, yytext()); System.out.print("Palavra Reservada "+ yytext() + "\n");}
{less} {addToken(TiposDeToken.OPERADOR_LESS, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{great} {addToken(TiposDeToken.OPERADOR_GREAT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{equal} {addToken(TiposDeToken.OPERADOR_EQUAL, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{different} {addToken(TiposDeToken.OPERADOR_DIFFERENT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{lessEqual} {addToken(TiposDeToken.OPERADOR_LESSEQUAL, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{greatEqual} {addToken(TiposDeToken.OPERADOR_GREATEQUAL, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{assign} {addToken(TiposDeToken.OPERADOR_ASSIGN, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{add} {addToken(TiposDeToken.OPERADOR_ADD, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{minus} {addToken(TiposDeToken.OPERADOR_MINUS, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{mult} {addToken(TiposDeToken.OPERADOR_MULT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{part} {addToken(TiposDeToken.OPERADOR_PART, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{comma} {addToken(TiposDeToken.COMMA, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{leftParenthesis} {addToken(TiposDeToken.LEFT_PARENTHESIS, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{rightParenthesis} {addToken(TiposDeToken.RIGHT_PARENTHESIS, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{rightShift} {addToken(TiposDeToken.OPERADOR_RIGHT_SHIFT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{leftShift} {addToken(TiposDeToken.OPERADOR_LEFT_SHIFT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{unsignedLeftShift} {addToken(TiposDeToken.OPERADOR_UNSIGNED_LEFT_SHIFT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{unsignedRightShift} {addToken(TiposDeToken.OPERADOR_UNSIGNED_RIGHT_SHIFT, yytext()); System.out.print("Operador "+ yytext() + "\n");}
{semicolon} {addToken(TiposDeToken.SEMICOLON, yytext()); System.out.print("Ponto e vírgula \n");}
{identifier} {addToken(TiposDeToken.IDENTIFICADOR, yytext()); System.out.print("Identificador "+ yytext() + "\n");}
{constant} {addToken(TiposDeToken.CONSTANT, yytext()); System.out.print("Constante "+ yytext() + "\n");}
{literal} {addToken(TiposDeToken.LITERAL, yytext()); System.out.print("Literal "+ yytext() + "\n");}

. { System.out.print("Caractere invalido" + yytext() + "\n"); }