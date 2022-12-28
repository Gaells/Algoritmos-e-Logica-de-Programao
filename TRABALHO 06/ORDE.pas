Program ORDE ;
//PROGRAMA QUE COMPARA O TEMPO DE ORDENAÇÃO DE UM VETOR COM 10.000 NUMEROS
//USANDO O ALGORITMO DO MATERIAL ESTUDADO EM SALA(REPEAT-->FOR)
//E O ALGORITMO (FOR-->FOR) NÃO RECOMENDADO O USO
//fup que monte um vetor com 10000 numeros e mostre-os em ordem crescente.
//apos montar o vetor, classifica-lo
//depois de classificado, ordenar e novo
//depois de ordenar o vetor classificado classificar de novo usando um método NAO INDICADO...
//COMPARAR OS TEMPOS DE EXECUÇÃO DAS TRES ORDENAR.
//USAR A GETTIME
VAR VET:ARRAY[1..10000] OF INTEGER;
AUX, A, B, TOT,H,M,S,C,jaord:INTEGER;
TROCA:BOOLEAN;
Begin
//MONTA O VETOR COM 10000 ALEATÓRIOS ENTRE 1 E 10000
FOR A:= 1 TO 10000 DO
 VET[A]:=RANDOM(10000)+1; 
FOR A:=1 TO 20 DO
 WRITELN(VET[A]:20);   //mostra os 20 primeiros
writeln;
//ORDENA 
TOT:=10000;
jaord:=1;
GETTIME(H,M,S,C);
WRITELN('     INICIO da ordenação (aleatorio)=>',H:2,':',M:2,':',S:2,':',C:3);
REPEAT
 TROCA:=TRUE;
 TOT:=TOT-jaord;
 FOR A:=1 TO TOT DO
  IF(VET[A]>VET[A+1])THEN
	 BEGIN
	  AUX:=VET[A];
		VET[A]:=VET[A+1];
		VET[A+1]:=AUX;
		TROCA:=FALSE;
		jaord:=1;
	 END
	else
	 jaord:=jaord+1;
UNTIL TROCA;
//FIM DA ORDENCAO
GETTIME(H,M,S,C);
WRITELN('     FIM da ordenação (aleatorio)   =>',H:2,':',M:2,':',S:2,':',C:3);
FOR A:=1 TO 20 DO
 WRITELN(VET[A]:20);
WRITEln('ENTER PARA CONTINUAR');
READLN;
writeln;
tot:=10000;
jaord:=1;
GETTIME(H,M,S,C);
WRITELN('     INICIO da ordenação (ja ordenado)=>',H:2,':',M:2,':',S:2,':',C:3);
REPEAT
 TROCA:=TRUE;
 TOT:=TOT-jaord;
 FOR A:=1 TO TOT DO
  IF(VET[A]>VET[A+1])THEN
	 BEGIN
	  AUX:=VET[A];
		VET[A]:=VET[A+1];
		VET[A+1]:=AUX;
		TROCA:=FALSE;
		jaord:=1;
	 END
	else
	 jaord:=jaord+1;
UNTIL TROCA;
//FIM DA ORDENCAO
GETTIME(H,M,S,C);
WRITELN('     FIM da ordenação (ja ordenado)   =>',H:2,':',M:2,':',S:2,':',C:3);
FOR A:=1 TO 20 DO
 WRITELN(VET[A]:20);
WRITEln('ENTER PARA CONTINUAR');
READLN;
writeln; 
//ORDENA (NUNCA USAR O METODO ABAIXO )
GETTIME(H,M,S,C);
WRITELN('     INICIO da ordenação nunca usar o metodo(ja ordenado)=>',H:2,':',M:2,':',S:2,':',C:3);
writeln;
tot:=10000;
FOR B:=1 TO TOT DO
 FOR A:=1 TO TOT-1 DO
  IF(VET[A]>VET[A+1])THEN
	 BEGIN
	  AUX:=VET[A];
		VET[A]:=VET[A+1];
		VET[A+1]:=AUX;
	 END;
//FIM DA ORDENAÇÃO DO METODO QUE NUNDA DEVE SER USADO
GETTIME(H,M,S,C);
WRITELN('     fim da ordenação nunca usar o metodo(ja ordenado)   =>',H:2,':',M:2,':',S:2,':',C:3);
writeln;
FOR A:=1 TO 20 DO
 WRITELN(VET[A]);
READLN;
End.