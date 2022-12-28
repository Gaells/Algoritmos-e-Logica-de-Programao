Program T02; // Gabriel Chioquetta Obladen
{FUP que leia uma série de notas. A leitura termina quando for lida uma nota
negativa. Antes de encerrar o programa, mostrar o total de notas lidas 
e a média das notas. VALIDAR A NOTA que será lida como string usando 
o modulo leia1 e no programa principal <=100 }

uses BIBLIONT;
var SOMA,C,NOTA:integer;
		MED:real;
		NOTAL:string;

//==================================================== código principal ====================================================//

begin {1}
	repeat    // validar - inicio
	
		LEIA1('digite a 1. nota ',NOTA);        
	  if(NOTA>100)then
	  writeln('Nota inválida!!');
	   
	until (NOTA<=100); //validar - fim ]
	
	while(NOTA >= 0) do 
	  begin {2}
	   	SOMA:= SOMA+NOTA;
     	C:= C+1;           // quando crio o contador está zerado, por isso acrescento um, la na frente ele recebe mais um 1, gerando a 2 nota
		repeat                // validar - inicio2
			writeln('Digite a ', C+1, ' Nota ');
			LEIA1('valor ',NOTA);        
	  	if(NOTA>100)then
	  	writeln('Nota inválida!!');
		until (NOTA <= 100); //validar - fim2 ]
	  end; {2}
  
  if(c<>0)then  //sempre que o divisor for uma variavel; garantir que seja diferente de zero
	 begin {3}
	  MED:=SOMA/C;
	  writeln('A quantidade de notas lidas foi de = ',C,' E a média das notas foi = ', MED:5:3);
	 end {3}
	else
	 writeln('Nada foi lido');
	 termine;
	 
end. {1}
