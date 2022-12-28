Program T5; // Gabriel Chioquetta Obladen
{FUP que leia uma relação de números positivos, encerrada por um número negativo. 
Após a leitura, mostrar os números pares lidos em ordem crescente e os 
números ímpares lidos em ordem decrescente. (Máximo de 100 números. 
Usar um só vetor e usar o algoritmo de ordenação que consta da apostila DS110_APOSTILA.DOCX).}
uses BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot, total: INTEGER;
       Achou : BOOLEAN;
		
Begin
tot:=0;
FOR A:=1 TO 5 DO
	begin
		WRITELN('DIGITE O ', A, ' $ NÚMERO');
  	READLN(VET[A]); 			{carrega o vetor de 100 números não repetidos e não ordenados}
  	Tot := tot + VET[A];
	END;				
  	READLN(outro_n);
  WHILE(outro_n >= 0) DO
  	BEGIN
{início da Pesquisa Sequencial Básica – Pbas}
  		Cont := 1;
  		Achou := FALSE;
       REPEAT
          IF( outro_n = vet[cont]) THEN
             Achou := TRUE		{encontrou o outro número em vet}
          ELSE
            Cont := cont + 1		{incrementa o contador}
     UNTIL(achou=TRUE) OR (cont  > tot);{Encerra quando: a)encontrou – achou = V, encontrou na posição “cont”;
                             	            			    b)não encontrou – “cont” maior que “tot”, logo, achou = F}
{fim da Pbas}
{verifica o resultado da Pbas}
      IF(achou=TRUE) THEN			{achou = verdade, encontrou; achou = falso, não encontrou}
         WRITE(outro_n,'na posição', cont)
      ELSE
         WRITE(outro_n,'não encontrado');
      READ(outro_n);
    END;	

end.