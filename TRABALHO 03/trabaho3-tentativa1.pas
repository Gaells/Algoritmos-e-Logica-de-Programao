Program Pzim ;
	{FUP que leia dia, m�s e ano e informe se a data lida � v�lida ou n�o.
	Para a data ser considerada v�lida, ano entre 1921 e 2009, m�s entre 1 e 12 
	e dia entre 1 e dias m�ximo do m�s lido. USAR uma fun��o l�gica para validar a data 
	e uma fun��o para devolver o n�mero m�ximo de dias do m�s lido. 
	Usar tamb�m a PROCEDURE LEIA1 do trabalho 02
				Exemplo:  Leu 31 04 2020  mostra DATA INVALIDA
                  Leu 29 02 2000  mostra DATA VALIDA    }
                  
  procedure leia1(OQUE:string[30];var int:integer);
  
  var ano, mes, dia, bis:integer;
  		
	function valAno(ano1:integer):boolean;
		var chave : boolean;
		//anov: integer;
	begin{1}
  	if (ano1<1921) then
			chave:= false;
  	if (ano1>2009) then
  		begin{2}
  			chave:= false;
  		end{2}
  	else
  		chave:= true;
			valAno:=chave;
	end;{1}

	function valMes(mes1:integer):boolean;
 		var chave : boolean;
	begin{3}
  	if (mes1<1) then
  		begin{4}
    		chave:= false;
  		end;{4}
  	if (mes1>12) then
  		begin{5}
    		chave:= false;
  		end{5}
  	else
  		chave:= true;
  		valMes:=chave;
	end;{3}

	function valDia(dia1, mes2, ano2, bis2:integer):boolean;
		var chave : boolean;
	begin{6}
  	if (dia1<1) then
  		chave:= false
  	else
  		bis2:=0;
  	if ((ano2 mod 4) = 0 ) then
  		bis2 := 1;
  
  	if (mes2=1) or (mes2=3) or (mes2=5) or (mes2=7) or (mes2=8) or (mes2=10) or (mes2=12) then
  		begin{7}
    		if (dia1>31) then
    			chave:= false
    		else
     			chave:= true;
  		end{7}
  	else
  		if (mes2=11) or (mes2=4) or (mes2=6) or (mes2=9) then
  			begin{8}
    	if (dia1>30) then
    		chave:= false
    	else
     		chave:= true;
  	end{8}
  else
  	if mes2=2 then
  		begin{9}
    	if bis=1 then
    	if(dia1>29) then
    	chave:= false
    	else
    	chave:= true;
    	if bis=0 then
    if (dia1>28) then
    chave:= false
    else
    chave:= true;
  end;{9}
   valDia:=chave;
  
end;{6}

	procedure chama(diax:integer; var mesx, anox, bisx:integer);
		begin{10}
			valAno(anox);
  		valMes(mesx);
  		valDia(diax, mesx,anox,bisx);
		end;{10}

Begin

  writeln('Insira o dia, m�s e ano desejado: ');
  readln(dia, mes, ano); // Solicita ao usuario o dia, mes a ano
  
  chama(dia, mes, ano, bis);  // utilizo o procedure 
  
  if (valAno(ano)) and (valMes(mes)) and (valDia(dia, mes,ano,bis)) then
  	write('data v�lida')
  else 
  	write('data inv�lida');   
End.