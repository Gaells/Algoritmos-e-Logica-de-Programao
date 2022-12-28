Program N03; // Gabriel Chioquetta Obladen
{FUP que leia dia, m�s e ano e informe se a data lida � v�lida ou n�o. Para a data ser considerada v�lida, ano entre 1921 e 2009, m�s entre 1 e 12 e dia entre 1 e dias m�ximo do m�s lido.
USAR uma fun��o l�gica para validar a data e uma fun��o para devolver o n�mero m�ximo de dias do m�s lido. Usar tamb�m a PROCEDURE LEIA1 do trabalho 02
Exemplo:  Leu 31 04 2020  mostra DATA INVALIDA
          Leu 29 02 2000  mostra DATA VALIDA
}
uses BIBLIONT;

var ano, mes, dia:integer;
   
Function diasmes(mm,aa:integer):integer; //funcao que devolve o n�mero m�ximo de dias 
																				//do m�s recebe(mm) e ano(aa) e devolve o m�ximo de dias no nome da function}
	Var diasma:integer;    //determina o n�mero de dias do m�s anterior � data atual para somar ao diasc
 		begin{1}
 			Diasma:=31;                               //� o que mais tem no ano (dias com 31 dias)																						
  if(mm=4) or (mm=6) or (mm=9) or (mm=11) then   //quando n�o � 31? Para abril, junho, setembro e novembro.
  	Diasma:=30;
  if(mm=2) then
  	begin{2}
    	Diasma:=28;    //quando n�o � 30 nem 31? Para fevereiro
  if((aa mod 4) = 0) then         //quando n�o � 28? Para ano bissexto (aa mod 4)=0 (ano m�ltiplo de 4)
  	Diasma:=29;
  	end;{2}
    Diasmes:= diasma;
  end;{1}

Function valdata(ddd,mmm,aaa:integer):Boolean;
  Var chav:Boolean;
begin{3}
 Chav:=true;     //mais f�cil provar que uma data � invalida
 if(aaa < 1921) or (aaa > 2009) then
    Chav:=false       //data inv�lida
 else
   if(mmm < 1) or (mmm > 12) then
     Chav:=false      //data inv�lida
   else
  	begin{4}      //idem para o dia usando a function diasmes
  		if(ddd < 1) or (ddd > diasmes(mmm,aaa)) then
      Chav:=false;
    end;{4}
   Valdata:=chav;
end;{3}

//============ PROGRAMA PRINCIPAL ============//

Begin{0}
  leia1('Insira dia ', dia);
  leia1('Insira o Mes ', mes);
  leia1('Insira o Ano ', ano);
  	
  if valdata(dia,mes,ano)  then
  	writeln('Data v�lida ', dia:2,'/',mes:1,'/',ano:4)
  else
  	writeln('data inv�lida');

 	termine;
End.{0}