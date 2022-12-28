Program N03; // Gabriel Chioquetta Obladen
{FUP que leia dia, mês e ano e informe se a data lida é válida ou não. Para a data ser considerada válida, ano entre 1921 e 2009, mês entre 1 e 12 e dia entre 1 e dias máximo do mês lido.
USAR uma função lógica para validar a data e uma função para devolver o número máximo de dias do mês lido. Usar também a PROCEDURE LEIA1 do trabalho 02
Exemplo:  Leu 31 04 2020  mostra DATA INVALIDA
          Leu 29 02 2000  mostra DATA VALIDA
}
uses BIBLIONT;

var ano, mes, dia:integer;
   
Function diasmes(mm,aa:integer):integer; //funcao que devolve o número máximo de dias 
																				//do mês recebe(mm) e ano(aa) e devolve o máximo de dias no nome da function}
	Var diasma:integer;    //determina o número de dias do mês anterior à data atual para somar ao diasc
 		begin{1}
 			Diasma:=31;                               //é o que mais tem no ano (dias com 31 dias)																						
  if(mm=4) or (mm=6) or (mm=9) or (mm=11) then   //quando não é 31? Para abril, junho, setembro e novembro.
  	Diasma:=30;
  if(mm=2) then
  	begin{2}
    	Diasma:=28;    //quando não é 30 nem 31? Para fevereiro
  if((aa mod 4) = 0) then         //quando não é 28? Para ano bissexto (aa mod 4)=0 (ano múltiplo de 4)
  	Diasma:=29;
  	end;{2}
    Diasmes:= diasma;
  end;{1}

Function valdata(ddd,mmm,aaa:integer):Boolean;
  Var chav:Boolean;
begin{3}
 Chav:=true;     //mais fácil provar que uma data é invalida
 if(aaa < 1921) or (aaa > 2009) then
    Chav:=false       //data inválida
 else
   if(mmm < 1) or (mmm > 12) then
     Chav:=false      //data inválida
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
  	writeln('Data válida ', dia:2,'/',mes:1,'/',ano:4)
  else
  	writeln('data inválida');

 	termine;
End.{0}