Program N05GABRIEL; // GABRIEL CHIOQUETTA OBLADEN
{FUP que leia uma relação de números positivos, encerrada por um número negativo. 
Após a leitura, mostrar os números pares lidos em ordem crescente e os números ímpares lidos em 
ordem decrescente. (Máximo de 100 números. Usar um só vetor e usar o algoritmo de ordenação 
que consta da apostila DS110_APOSTILA.DOCX).}
uses BIBLIONT;
 
var VET:array[1..100] of integer;
		aux,A,lidos,tot: integer;
		troca,cont: boolean;

begin{0}
	A:=1;
	leia1('Digite o(s) numero(os) ',VET[A]);
 	while(VET[A]>0) and (A<100) do
		begin{1}				
			A:=A+1;
	    leia1('Digite o(s) numero(os) ',VET[A]);
 		end;{1}	
	lidos:=A;
	if(A>1) then
		begin{3}
			tot:=A;		
	repeat
		tot:=tot-1;
		troca:=true;
					
	for A:=1 to tot do
		if(VET[A] > VET[A+1]) then 
			begin{4}						
				aux:=VET[A];
				VET[A]:=VET[A+1];
				VET[A+1]:=aux;
				troca:= false;							
			end;{4}
						
until(troca);
	
	writeln('Os números pares em ordem crescente são: ');
		for A:=1 to lidos do
			if((VET[A] > 0) and ((VET[A] mod 2)=0)) then
				writeln(VET[A]:3);
			
	writeln('Os números ímpares em ordem crescente são: ');
 		for A:=1 to lidos  do
			if((VET[A]>0) and ((VET[A] mod 2)=1)) then
				writeln(VET[A]:3);
	end{3}
	
	else
		begin{5}
	  	writeln('Nenhum número válido foi lido');
	  end;{5}
	  
	termine;

End.{0}