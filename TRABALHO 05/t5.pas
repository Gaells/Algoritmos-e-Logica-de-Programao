Program T05 ; // GABRIEL CHIOQUETTA OBLADEN
{FUP que leia uma rela��o de n�meros positivos, encerrada por um n�mero negativo. 
Ap�s a leitura, mostrar os n�meros pares lidos em ordem crescente e os n�meros �mpares lidos em 
ordem decrescente. (M�ximo de 100 n�meros. Usar um s� vetor e usar o algoritmo de ordena��o 
que consta da apostila DS110_APOSTILA.DOCX).}
uses BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot, total: INTEGER;
       Achou : BOOLEAN;
		
Begin
tot:=0;
FOR A:=1 TO 5 DO
	begin{1}
		WRITELN('DIGITE O ', A, ' N�MERO');
  	READLN(VET[A]); 			{carrega o vetor de 100 n�meros n�o repetidos e n�o ordenados}
  	Tot := tot + VET[A];
	END;{2}

	
	
	
	
	
end.				