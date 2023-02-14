Program N10_2_GabrielC;	{Atividade 10.2 Nome: Gabriel Chioquetta Obladen}

uses bibliont;
const
cargos:array [1..12] of string[22]=
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );

var
		arq:file of regis;
		reg:regis;
		escolha:char;
		vet:vetor;
		totcar:array[1..12] of integer;
		claal,clacarg,clage:string[4];
		numcarg:string[2];
		a,e,x,tot,cont,contlinha,cargant:integer;

//================= programa principal ================//
begin{1}
  Assign(arq,'cand.ind');  //linka nome fisico ao logico
  reset(arq);              
  
  writeln('Olá! Escolha uma das opções abaixo para mostrar os candidatos de forma ordenada!');
  writeln('1 - Classificados por ordem alfabética');
  writeln('2 - Classificação por cargo');
  writeln('3 - Classificação geral');
  readln(escolha);
  
  while (escolha<'1') or (escolha>'3') do  //validação
  	begin{2}
    	writeln('escolha inválida! Por favor escolher uma das opções abaixo!');
    	writeln('1 - Classificados por ordem alfabética');
    	writeln('2 - Classificação por cargo');
    	writeln('3 - Classificação geral');
    	readln(escolha);
  	end;{2}
  
  repeat
    a:=a+1;
    vet[a].pf:=cont;
    read(arq,reg);
    
		case (escolha) of     // da as opções para escolha
      '1':begin{3}
        //cc tem q ter diferente de 0
        str(reg.ccl:4,claal);
        vet[a].cc:=claal+reg.nome;
      		end;{3}
      '2':begin{4}
        //.CC=CAMPO.CAR+CAMPO.CLC
        str(reg.clc:4,clacarg);
        str(reg.car:2,numcarg);
        vet[a].cc:=numcarg+clacarg;
      		end;{4}
      '3':begin{5}
        //.CC=CAMPO.CLG
        str(reg.clg:4,clage);
        vet[a].cc:=clage;
      		end;{5}
    end;
    cont:=cont+1;
  until eof(arq);
  
  
  tot:=a;
  for a:= 1 to 20 do
  	writeln(vet[a].pf:5,' ',vet[a].cc);
  	writeln('ordenando');
  	ordem(vet,tot);
  	writeln('fim da ordenação');
  
  for x:=1 to tot do
  	begin{6}
    	seek(arq,vet[x].pf);
    	read(arq,reg);
    	e:=e+1;
    
	if (escolha='1') and (reg.ccl<>0) then
    begin{7}
      if(contlinha mod 25=0) or (cargant<>reg.car) then
      	begin{8}
        	readln;
        	clrscr;
        	writeln;
        	writeln('CARGO => ',cargos[reg.car]);
        	writeln;
        	writeln('  ORD  NUM NOME                                NASCIMENTO CARGO');
        	contlinha:=0;
      	end;{8}
    end;{7}
    
	if (escolha<>'1') then
    begin{9}
      if(contlinha mod 25=0) or (cargant<>reg.car) and (escolha='2') then
      	begin{10}
        	readln;
        	clrscr;
        	writeln;
        
	if (escolha='2') then
        begin{11}
          writeln('CARGO => ',cargos[reg.car]);
          writeln;
        end;{11}
        
				writeln('  ORD  NUM NOME                                  SOM  N4  N5  N3  N2  N6  N1   NASCIMENTO CAR'); 
        contlinha:=0;
      	end;{10}
    end;{9}
    
	if (escolha='1') and (reg.ccl<>0) then
    begin{12}
      writeln(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
    end{12}
  else
    if (escolha<>'1') then
    begin{13}
      WRITE(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.SOM:5,REG.NOTAS[4]:4,REG.NOTAS[5]:4,REG.NOTAS[3]:4,REG.NOTAS[2]:4,REG.NOTAS[6]:4,REG.NOTAS[1]:4,'   ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO:3,REG.CAR:3);
      writeln;
  
	if (escolha='3') then
      begin{14}
			if (reg.falta=1) then
      writeln('Obs.: Faltante');
      end;{14}
		end;{13}
    cargant:=reg.car;
    contlinha:=contlinha+1;
  end;{6}
  
  close(arq);
  termine;

End.{1}