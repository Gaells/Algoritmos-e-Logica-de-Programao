PROGRAM DOIS;
uses BIBLIONT;
 
Var num:array[1..10] of integer; {declara que a vari�vel num, � um vetor de 10 
                                  posi��es com �ndices variando de 1 at� 10}        
		a,b:integer; 
Begin 
  For a:=1 to 5 do
  	begin
		writeln('Digite os numeros '); 
    Readln(num[a]); {l� os 10 n�meros e leva para MP colocando cada n�mero em uma
                                                Posi��o, indicada por �a�, na vari�vel num}
    end;
    For b:=5 downto 1 do 
      writeln (num[b]); {mostra o conte�do da MP na ordem inversa, pois come�a por 10, logo,
                                                 ir� mostrar o conte�do de num[10] }
			termine; 
end. 
