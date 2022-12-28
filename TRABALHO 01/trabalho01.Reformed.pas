Program N01GABRIELC ; // Gabriel Chioquetta
{FUP que mostre a tabuada dos números entre 1 e 10. 
Para cada tabuada mostrada, parar o processamento (‘enter para continuar’).}
uses BIBLIONT;

var num, x, i:integer;

Begin

	writeln('Enter para iniciar o Programa');
	readln;
	
	for i:= 1 to 10 do             // vai de 1 a 10 fazer a multipicação e mostrar o valor
		begin
			writeln('Enter para continuar'); // depois (para) quando termina a primeira tabuada,
			readln;                         // e quando aperta enter o i modifica de valor e repete a ação
			for x:=0 to 10 do
				begin
				num:= i*x;
				writeln(i, ' x ', x, ' = ', num:5);
				end;
			  
		end;
		 
termine;
  
End.