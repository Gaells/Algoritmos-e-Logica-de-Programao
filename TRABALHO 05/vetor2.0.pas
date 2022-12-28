PROGRAM VETOR;
USES BIBLIONT;

Var vet:ARRAY[1..5] OF INTEGER;
       Outro_n, cont, a, tot: INTEGER;
       Achou : BOOLEAN;
BEGIN
	WRITELN('DIGITE OS NUMEROS');
  FOR A:=1 TO 5 DO
    READLN(VET[A]); 			{carrega o vetor de 100 números não repetidos e não ordenados}
  	Tot := 5;				
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
END.
