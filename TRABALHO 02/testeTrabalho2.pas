Program Pzim ; // Gabriel Chioquetta Obladen
//---------------------------------------------------------------------------------------------------------------------
	
	var SOMA, C, NOTAINT, ERRO: integer;
			MED:real;
			NOTA:string;
 			
//---------------------------------------------------------------------------------------------------------------------

procedure converte(Nstring: string; var notin: integer; var codigoErro:integer);
begin{1}
  val (Nstring, notin, codigoErro);
end{1};
//====================================================
begin {2}
  writeln('Escreva as notas');
  writeln('o programa se encerra e a quantidade de notas e sua média será mostrada assim que for inserida uma nota negativa ou maior que 100');
  readln(NOTA);
//==================================================== código principal ====================================================//   
  repeat               // validar - inicio
	  write('digite a 1. nota --> ');
	  readln(NOTA);
	  if(NOTA>100)then
	   writeln('Nota inválida!!');
	 until (NOTA<=100); //validar - fim ]
	 while(NOTAINT >= 0) do
	  begin
	   	SOMA:= SOMA+NOTAINT;
     	C:= C+1;
	repeat// validar - inicio
	    write('digite a ',c+1:2,'. nota --> ');
	    readln(NOTA);
	    if(NOTA>100)then
	     writeln('Nota inválida!!');
	   until (NOTA <= 100); //validar - fim ]
	  end;
	
	// função de converter	 
  converte(NOTA,NOTAINT,ERRO);
  
	if(c<>0)then  //sempre que o divisor for uma variavel; garantir que seja diferente de zero
	 begin
	  MED:=SOMA/C;
	  writeln('A quantidade de notas lidas foi de = ',C:3,' E a média das notas foi de ---- média = ',MED:10:3);
	 end
	else
	 writeln('nada foi lido');
	 
end. {2}