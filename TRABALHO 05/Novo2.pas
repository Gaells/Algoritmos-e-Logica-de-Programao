Program N06 ; // Gabriel Chioquetta
{FUP que leia todos os registros do arquivo recebido e mostre antes de encerrar, 
a quantidade de vezes que cada um dos 60 números foi sorteado.

Mostrar:
01 – 55 vezes
02 – 87 vezes
03 – 72 vezes
...   

Você está recebendo o arquivo “resultmegasena.txt” que contém os resultados 
dos concursos da mega sena, cujo registros é um string[33], com o lay-out abaixo:

2544 30/11/2022 25 38 45 53 55 56
2543 26/11/2022  2  5 27 30 46 53

01-04=número do concurso
06-15=data do concurso
16-33=números sorteados (6), ou seja, 16-18=primeiro, 19-21=segundo, 22-24=terceiro, etc...
Obs.: os números sorteados são valores entre 01 e 60.}

USES BIBLIONT;

VAR ARQ:TEXT; //NOME LÓGICO COM AS CARACTERISTICAS DO ARQUIVO
	  REG:STRING[33]; //CONTERA O REGISTRO LIDO
	  CONTA:ARRAY[1..60] OF INTEGER; //CONTERA A CONTAGEM DO NUMERO DE VEZES QUE CADA NUM SAIU
	  NUM:ARRAY[1..6] OF INTEGER;  //CONTERA OS 6 NUMEROS SORTEADOS POR CONCURSO
	  UNI:STRING[3]; //CONTERA UM NUMERO SORTEADO COMO STRING[3] 
	  A,B,C, aux:INTEGER; //A NO FOR, B NO VAL E C ONDE COMEÇA A LEITURA DOS SORTEADOS
	  
	 
Begin{1}

ASSIGN(ARQ,'RESULTMEGASENA.TXT');  //LIGA NOME LOGICO AO FISICO
RESET(ARQ);	                      //ABRE O ARQUIVO PARA LEITURA
 	WHILE NOT EOF(ARQ) DO
		BEGIN{2}
			READLN(ARQ,REG);
	 		WRITE(COPY(REG,1,4),'---',COPY(REG,6,10));
	 		C:=16;
	 	FOR A:=1 TO 6 DO
	  	BEGIN{3}         // copia do registro 3casas após o C(16) (16,17,18) ...
	   		UNI:=COPY(REG,C,3); //RETIRA DE REG OS NUMEROS INDIVIDUALMENTE
	   		VAL(UNI,NUM[A],B);  //TRASNF OS NUMEROS EM INTEGER E JOGA NO VETOR NUM[A]
	   		WRITE(NUM[A]:3);  // MOSTRA NA TELA OS VALORES
	   		C:=C+3; // COM O C:=C+3 ELE LÊ OS DEMAIS NÚMEROS SORTEADOS	
	  	END;{3}
	  WRITELN;
	END;{2}
{	
	for A:=1 to	60 do       // vai repetir os numeros de 1 a 60 e mostrar quantas vezes cada um apareceu
		if(NUM[A] > CONTA[A]) THEN
		BEGIN
		AUX:=NUM[A];
		NUM[A]:=CONTA[A];
		CONTA[A] := AUX;
		writeln('O numero ', A, ' Apareceu ', CONTA[A], ' vezes ');
		END; }
		
 	TERMINE;
 	CLOSE(ARQ);  // fecha o arquivo
	
End.{1}