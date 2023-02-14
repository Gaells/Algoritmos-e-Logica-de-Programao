Program N08;  // Gabriel Chioquetta
{FUP que possibilite mostrar os dados (veja leinddir.pas) do arquivo CAND.IND em ordem :
1 – Inscrição ou, 2 – Alfabética ou, 3 – Cpf ou, 4 - Cargo e alfabética dentro do cargo. 
Dar as quatro opções para o usuário escolher uma delas.}

uses BIBLIONT;

CONST CARGOS:ARRAY [1..12] OF STRING[22]=
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );
//=====================
Var
arq2:file of regis;
reg:regis;
//:string[35];
carga:string[2];
insc:string[4];
pf,cont,a,tot,x,escolha,e,contlin,cargant:integer;
vet:vetor;
totcar:array[1..12] of integer;

//==============================  código principal  ==================//

Begin
  Assign(arq2,'cand.ind');
  reset(arq2);
  
  writeln('Olá! Escolha uma das opções abaixo para mostrar os candidatos de forma ordenada!');
  writeln('1 - Inscrição ou, 2 - Alfabética ou, 3 - Cpf ou, 4 - Cargo e alfabética dentro do cargo.');
  readln(escolha);
  
  while (escolha<1) or (escolha>4) do
  begin
    writeln('escolha inválida! Por favor escolher uma das opções abaixo!');
    writeln('1 - Inscrição ou, 2 - Alfabética ou, 3 - Cpf ou, 4 - Cargo e alfabética dentro do cargo.');
    readln(escolha);
  end;
  
  repeat
    a:=a+1;
    vet[a].pf:=cont;
    read(arq2,reg);
    
    case (escolha) of
      1: begin
        str(reg.num:4,insc);
        vet[a].cc:=insc;
      end;
      2: begin
        vet[a].cc:=reg.nome;
      end;
      3: begin
        vet[a].cc:=reg.cpf;
      end;
      4: begin
        str(reg.car:2,carga);
        vet[a].cc:=carga+reg.nome;
      end;
    end;
    cont:=cont+1;
  until eof(arq2);
  
  tot:=a;
  for a:= 1 to 20 do
  writeln(vet[a].pf:5,' ',vet[a].cc);
  writeln('ordenando');
  ordem(vet,tot);
  writeln('fim da ordenação');
  
  
  for a:=1 to 20 do
  writeln(vet[a].pf:5,' ',vet[a].cc);//idem, ordenados
  write('enter para continuar');
  readln;
  
  for x:=1 to tot do //PARA LER DO PRIMEIRO AO ULTIMO
  begin
    seek(arq2,vet[x].pf);     //POSICIONA
    read(arq2,reg);
    
    e:=e+1;
    if(REG.CAR>0)then
    totcar[REG.CAR]:=totcar[REG.CAR]+1;
    if(contlin mod 25=0) or (cargant<>reg.car) and (escolha=4) then
    begin
      readln;
      clrscr;
      writeln;
      write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      writeln('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
      contlin:=0;
    end;
    
    write(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
    for a:=1 to 6 do
    write(REG.NOTAS[A]:4);
    writeln(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
     
    cargant:=reg.car;
    contlin:=contlin+1;
  end;
  
  close(arq2);
  writeln;
  writeln;
  writeln('TOTAL DE INSCRITOS POR CARGO');
  for a:=1 TO 12 DO
  writeln(a:3,' -- ',cargos[a],' -->',totcar[a]:4);
  writeln('TOTAL DE REGISTROS LIDOS', E:5);
  termine;
  
END.
