PROGRAM VETOR;
USES BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot: INTEGER;
       Achou : BOOLEAN;
BEGIN
	WRITELN('DIGITE OS NUMEROS');
  FOR A:=1 TO 5 DO
    READLN(VET[A]); 			{carrega o vetor de 100 n�meros n�o repetidos e n�o ordenados}
  	Tot := 5;				
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
END.
