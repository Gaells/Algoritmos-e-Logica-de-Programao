PROGRAM ORDENACAO;

uses BIBLIONT;

Var vet:array[1..13] of integer;
    Aux,a,tot : integer;
    Troca : boolean;
begin
write('Digite os numeros');
    for a:= 1 to 13 do
    	readln(vet[a]); {carrega o vetor}
			tot := 13;	
			
			{início da ordenação}
	    
			Repeat
	   		tot := tot - 1;
	   		Troca := true;
	   	for a:= 1 to tot do
				if( vet[a] > vet[a+1]) then
					begin
						Aux := vet[a];
						Vet[a] := vet[a+1];
						Vet[a+1] := aux;
						Troca := false;
					end;
			until(Troca);    
			
			{fim da ordenação}
    									
	
	writeln('Ordem crescente');
	
	for a:= 1 to 13 do
	writeln(vet[a]);
    writeln('Ordem decrescente');
	for a:= 13 downto 1 do
	writeln(vet[a]);
	
	TERMINE;
end.