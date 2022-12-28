Program T05 ; // GABRIEL CHIOQUETTA OBLADEN
{FUP que leia uma relação de números positivos, encerrada por um número negativo. 
Após a leitura, mostrar os números pares lidos em ordem crescente e os números ímpares lidos em 
ordem decrescente. (Máximo de 100 números. Usar um só vetor e usar o algoritmo de ordenação 
que consta da apostila DS110_APOSTILA.DOCX).}
uses BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot, total: INTEGER;
       Achou : BOOLEAN;
		
Begin
tot:=0;
FOR A:=1 TO 5 DO
	begin{1}
		WRITELN('DIGITE O ', A, ' NÚMERO');
  	READLN(VET[A]); 			{carrega o vetor de 100 números não repetidos e não ordenados}
  	Tot := tot + VET[A];
	END;{2}

	
	
	
	
	
end.				