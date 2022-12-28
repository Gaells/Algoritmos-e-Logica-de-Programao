Program N04 ;  // Gabriel Chioquetta
{Uma determinada escola possui 10 cursos, numerados de 1 até 10.
FUP que leia dados dos alunos desta escola (código do curso, 
matrícula e nota final – por exemplo de matemática. 
Código do curso igual ou menor que zero, encerra a leitura) e antes 
de encerrar o programa, mostre a média das notas de matemática por curso. 
Ex.: curso 1 media = 56.47
		curso 2 média = 49.16 }
		
uses BIBLIONT;

Var total,soma:array[1..10] of integer;
    Cod,nota,x:integer;
    Mat:string[13];
    Med:real;   {med := soma / total }

Begin
	repeat
		leia1('Digite o código ', Cod);
	until(cod < 10);
		while (cod > 0) do
			begin{1}
  			writeln('digite a matricula');
        readln(mat);
        
        repeat                            	// garante que a nota não é menor que 0 
					leia1('Digite a nota ', nota);
        until(nota >= 0) and (nota <= 100);			// e nem que é maior que 100
        	Total[cod] := total[cod] + 1;
        	Soma[cod] := soma[cod] + nota;  
				Repeat
  				Leia1('digite o codigo ', cod);
				until(cod < 10); 
      end;{1}
  // ------------ calcula e mostra as médias dos 10 cursos  -------------- //
  
	for x:=1 to 10 do
    if (total[x] > 0) then
    	begin{2}
      	Med := soma[x] / total[x];
        writeln('curso ', x:2 ,' media = ', med:8:2);
      end{2}
  	else 
     	writeln('curso ',x:2,' não possui alunos ');
			
	termine;		 
End.