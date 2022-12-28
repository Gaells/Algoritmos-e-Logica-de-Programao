PROGRAM DOIS;
uses BIBLIONT;
 
Var num:array[1..10] of integer; {declara que a variável num, é um vetor de 10 
                                  posições com índices variando de 1 até 10}        
		a,b:integer; 
Begin 
  For a:=1 to 5 do
  	begin
		writeln('Digite os numeros '); 
    Readln(num[a]); {lê os 10 números e leva para MP colocando cada número em uma
                                                Posição, indicada por “a”, na variável num}
    end;
    For b:=5 downto 1 do 
      writeln (num[b]); {mostra o conteúdo da MP na ordem inversa, pois começa por 10, logo,
                                                 irá mostrar o conteúdo de num[10] }
			termine; 
end. 
