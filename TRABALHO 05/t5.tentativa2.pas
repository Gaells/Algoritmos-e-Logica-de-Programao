Program T5; // Gabriel Chioquetta Obladen
{FUP que leia uma rela��o de n�meros positivos, encerrada por um n�mero negativo. 
Ap�s a leitura, mostrar os n�meros pares lidos em ordem crescente e os 
n�meros �mpares lidos em ordem decrescente. (M�ximo de 100 n�meros. 
Usar um s� vetor e usar o algoritmo de ordena��o que consta da apostila DS110_APOSTILA.DOCX).}
uses BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot, total: INTEGER;
       Achou : BOOLEAN;
		
Begin
tot:=0;
FOR A:=1 TO 5 DO
	begin
		WRITELN('DIGITE O ', A, ' $ N�MERO');
  	READLN(VET[A]); 			{carrega o vetor de 100 n�meros n�o repetidos e n�o ordenados}
  	Tot := tot + VET[A];
	END;				
  	READLN(outro_n);
  WHILE(outro_n >= 0) DO
  	BEGIN
{in�cio da Pesquisa Sequencial B�sica � Pbas}
  		Cont := 1;
  		Achou := FALSE;
       REPEAT
          IF( outro_n = vet[cont]) THEN
             Achou := TRUE		{encontrou o outro n�mero em vet}
          ELSE
            Cont := cont + 1		{incrementa o contador}
     UNTIL(achou=TRUE) OR (cont  > tot);{Encerra quando: a)encontrou � achou = V, encontrou na posi��o �cont�;
                             	            			    b)n�o encontrou � �cont� maior que �tot�, logo, achou = F}
{fim da Pbas}
{verifica o resultado da Pbas}
      IF(achou=TRUE) THEN			{achou = verdade, encontrou; achou = falso, n�o encontrou}
         WRITE(outro_n,'na posi��o', cont)
      ELSE
         WRITE(outro_n,'n�o encontrado');
      READ(outro_n);
    END;	

end.