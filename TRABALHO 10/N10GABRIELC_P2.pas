Program N10; {Gabriel Chioquetta Obladen      PARTE 2

FUP que possibilite mostrar os dados do arquivo CAND.IND conforme abaixo:
1 � Todos os candidatos CLASSIFICADOS nos cargos em ordem alfab�tica ou, 
2 � Todos os candidatos em ordem de classifica��o por cargo ou, 
3 � Todos os candidatos em ordem de classifica��o geral. 
Dar as tr�s op��es para o usu�rio escolher uma.}

uses BIBLIONT;

var 
		pf,cont,a,tot,x,escolha,e,contlin,cargant, clg, ccl, clc:integer;  //clg - classif geral, ccl- , clc - classif no cargo
		clga, ccla, clca:string;
		ARQ: FILE OF REGIS;
		reg:regis;
		insc:string[4];
		vet:vetor;
		carga:string[2];
		totcar:array[1..12] of integer;
		 

Begin
  ASSIGN(ARQ, 'CAND.IND');
  RESET(ARQ);
  
  writeln('Escolha entre as op��es de classifica��o:');
  writeln('1- Todos os candidatos CLASSIFICADOS nos cargos em ordem alfab�tica');
  writeln('2- Todos os candidatos em ordem de classifica��o por cargo');
  writeln('3- Classifica��o Geral');
  readln(escolha);
  
  while (escolha<1) or (escolha>3) do
  	begin
    	writeln('escolha inv�lida! Por favor escolher uma das op��es abaixo!');
    	writeln('1- Todos os candidatos CLASSIFICADOS nos cargos em ordem alfab�tica');
    	writeln('2- Todos os candidatos em ordem de classifica��o por cargo');
    	writeln('3- Classifica��o Geral');
    	readln(escolha);
  	end;
  
  
  repeat
  a:=a+1;
  vet[a].pf:=cont;
  read(arq,reg);
  
  case (escolha) of
      1: begin
        str(reg.car:2,carga);
        vet[a].cc:=carga+reg.nome;
      end;
      2: begin
        vet[a].cc:=carga;
      end;
      3: begin
      	str(reg.clg:2,clga);
        vet[a].cc:=clga;
      end;
    end;
    cont:=cont+1;
  until EOF (arq);
  
  
  tot:=a;
  for a:= 1 to 20 do
  writeln(vet[a].pf:5,' ',vet[a].cc);
  writeln('ordenando');
  ordem(vet,tot);
  writeln('fim da ordena��o');
  
  for a:=1 to 20 do
  writeln(vet[a].pf:5,' ',vet[a].cc);//idem, ordenados
  write('enter para continuar');
  readln;
  
  
  for x:=1 to tot do //PARA LER DO PRIMEIRO AO ULTIMO
  begin
    seek(arq,vet[x].pf);     //POSICIONA
    read(arq,reg);
    
    e:=e+1;
    if(REG.CAR>0)then
    totcar[REG.CAR]:=totcar[REG.CAR]+1;
    if(contlin mod 25=0) or (cargant<>reg.car) and (escolha=1) then
    begin
      readln;
      clrscr;
      writeln;
      write('  ORD  NUM N O M E                             NASCIMENTO   CAR');
      contlin:=0;
    end;
    
    write(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
     
    cargant:=reg.car;
    contlin:=contlin+1;  
  end;
  
 
 
	CLOSE(ARQ);
	termine;	
  
End.