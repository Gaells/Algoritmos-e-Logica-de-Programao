Program N07GABRIEL; // Gabriel Chioquetta
{Faça um programa que leia as respostas de uma prova de múltipla escolha de 6 (seis) disciplinas, 
constantes no arquivo de acesso sequencial tipo texto “prova.txt” (no anexo), cada registro é um string[64] e é composto por:
01-04    = número do candidato
05-64    = as sessenta respostas da prova, assim divididas;
05 – 09 = respostas da disciplina 1 (05 questões);
10 – 19 = respostas da disciplina 2 (10 questões);
20 – 29 = respostas da disciplina 3 (10 questões);
30 – 49 = respostas da disciplina 4 (20 questões);
50 – 59 = respostas da disciplina 5 (10 questões);
60 – 64 = respostas da disciplina 6 (05 questões);
Após ler o registro, o programa deverá corrigir a prova do candidato, por disciplina e gravar o número do candidato 
e as notas das 6 (seis) disciplinas no arquivo de acesso sequencial tipo texto “notas.txt”, cujo registro será um string[28]. 
A nota máxima de cada uma das 6 (seis) disciplinas  é 100. Os registros de “notas.txt” devem ficar como abaixo
01 – 04 = número do candidato
05 – 08 = nota da disciplina 1;
09 – 12 = nota da disciplina 2;
13 – 16 = nota da disciplina 3;
17 – 20 = nota da disciplina 4;
21 – 24 = nota da disciplina 5;
25 – 28 = nota da disciplina 6;
Ou seja:
0002  40    0    0  30  45  50
0003  50  10  10  25  45  40
............................ }
uses Bibliont;

var arq1, arq2:text; // arq1:= prova.txt arq2:= notas.txt
reg1:string[64]; // vai contar o numero e as respotas // prova.txt
reg2:string[28]; // vai conter o numero e as notas / notas.txt
notas:array[1..6] of integer; // vai conter as 6 notas das disciplinas
ns:string[4]; // vai conter a nota convertida p string

num, nninteger, validar, teste, a, b, c, d, e, f, x:integer;
notastr:array[1..6] of string;  // vai conter as 6 notas convertidas p string
gab:string[60]; // vai conter o gabarito    
numstr:string;
chave:boolean;

const	
inidis:array[1..6] of integer=(5, 10, 20, 30, 50, 60);    // inicio da disciplina
fimdis:ARRAY[1..6] of integer=(9, 19, 29, 49, 59, 64);   // fim da disciplina
peso:array[1..6] of integer=(20,10,10,5,10,20);         // peso por disciplina

//================================ programa principal =================================//
begin{0}
	assign(arq1, 'PROVA.TXT');   //LIGA NOME LOGICO AO FISICO 
	reset(arq1);                //ABRE O ARQUIVO PARA LEITURA
	assign(arq2, 'NOTAS.TXT');
	rewrite(arq2);
	
	// Lê o gabarito e ja valido ele
	begin{1}
		repeat
			chave:=true;
			writeln('Insira o gabarito das 60 questões');
      readln(gab);
			gab:=upcase(gab); //transformo tudo em maiuscula para n ter erros
			c:=length(gab);  // descubro o tamanho total do gabarito  e jogo em c
			f:=1;
				repeat
          if ((c<60) or (c>60)) then               // não deixo que seja colocado um gabarito menor que 60 e se tiver algo mario que 60 so leio até o 60
          chave:=false;
          if ((gab[f]<'A') or (gab[f]>'E')) then
          chave:=false;
          f:=f+1;
        until ((f>60) or (not chave));
    until (chave);
	end{1};
	
	while not eof (arq1) do     // vai ler todo o arquivo
		begin{2}
			a:=a+1;
			readln(arq1, reg1); // le o numero e resposta de cada candidato
			
			numstr:=copy(reg1,1, 4);
			insert(numstr, reg2, 1);
			
			
			// Corrige a prova calculando a nota por disciplina
			for d:=1 to 6 do
				begin{3}
			   	nninteger:=0;
        
					for b:=inidis[d] to fimdis[d] do
          	if (reg1[b]= gab[b-4]) then
          		nninteger:= nninteger+1;
          		notas[d]:=nninteger; 
							notas[d]:= notas[d]* peso[d]; 
      	end;{3}
				      	
      
      //USE A “STR” PARA CONVERTER A NOTA INTEGER PARA UM STRING[4] INSERIR NN EM REG2 
			//NA POSIÇÃO CORRESPONDENTE A NOTA DA DISCIPLINA
      
			teste:=5;
      for x:=1 to 6 do
      begin{4}
        str(notas[x]:4,notastr[x]);
        insert(notastr[x],reg2,teste);
        teste:=teste+4;
      end;{4}
      
      writeln(arq2,reg2);
      
    end;{2}
    
    writeln('REGISTROS LIDOS=',A:7);
    close(arq1);
    close(arq2);
    termine;
				
	
end.{0}