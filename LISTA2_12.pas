Program Pzim ;
{12.	FUP que realize a correção de uma prova de múltipla escolha com 25 questões 
de 5 alternativas cada (A,B,C,D,E) com apenas uma alternativa sendo a correta. O 
programa deverá ler o GABARITO e após, uma série de dados que contém o número de 
inscrição e as 25 respostas dos candidatos. Para cada conjunto de dados lido 
(inscrição e 25 respostas), corrigir a prova e mostrar, Inscrição, Número de 
respostas certas, erradas e deixadas em branco (sem resposta) e a Nota = certas * 4. 
A série de dados termina com uma matrícula igual a zero. Antes de encerrar o 
programa deve mostrar a média aritmética da prova.
montar um vetor com 20 conjunto de dados inscr+25
usar o fato do string poder ser tratado como vetor} 
USES BIBLIONT;
var gaba:string[25];
    resp:array[1..20] of string[29];//4 inscriçao + 25 respostas
                                    //atenção, depois de montado, o vetor pode ser tratado como
                                    //uma matriz 20 linhas X 29 colunas
    ce,er,sr,soma,totp,a,nota,x:integer;
    med:real;
    erro:boolean;
Begin
  repeat//valida o gabarito
   writeln('                   1234567890123456789012345');
	 write('digite o cabarito=>');
	 readln(gaba);
	 gaba:=upcase(gaba);
	 a:=1;
	 erro:=false;
	 repeat
	  if(gaba[a]<'A') OR (GABA[A]>'E')THEN
	   begin
		  WRITELN('ILEGAL');
		  erro:=true;
		 end
	  ELSE
	   A:=A+1
	 UNTIL( A>25 ) or (erro)
	UNTIL(A>25);
//leitura das inscr e resp
  for a:= 1 to 20 do
   begin
    write(a:3,' inscr+resp=>');
    readln(resp[a]);
    resp[a]:=upcase(resp[a]);
   end;
// corrige a prova
 for x:=1 to 20 do //x=contador provas lidas
  begin
//tem que inicializar os contadores individuais de certas, erradas e sem resp...
   ce:=0;
	 er:=0;
	 sr:=0;
	 for a:= 1 to 25 do
    begin
     if(gaba[a]=resp[x,a+4])then
      ce:=ce+1
     else
      if(resp[x,a+4]=' ') or (resp[x,a+4]=chr(0))then
       sr:=sr+1
      else
       er:=er+1;
    end;
    nota:=ce*4;
    soma:=soma+nota;
    totp:=totp+1;
   writeln(copy(resp[x],1,4),' nota=', nota:5,'  certas=',ce:3,'  erradas=',er:3,' sem resp=',sr:3);//ver "copy" na apostila do pascal
  end;
  med:=soma/20;
  writeln('media=',med:10:2); 
	TERMINE; 
End.