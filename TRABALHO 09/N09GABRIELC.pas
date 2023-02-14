Program N09;  // Gabriel Chioquetta Obladen
{faça um programa que atualize os campos das 6 notas e o campo soma 
das notas dos registros do arquivo CAND.IND, dos candidatos presentes. 
Antes, executar o programa marcafaltas.pas, 
(atualiza o campo reg.falta com 1) enviado. Para atualizar as notas, 
utilize o arquivo NOTAS.TXT, criado pelo “trabalho 07” (usando o arquivo “PROVA.TXT”). 
Antes de encerrar, mostrar a média das 6 disciplinas}

uses bibliont;
var
arq:file of regis;
reg:regis;
reg2:string[28];
falta,notas:text;
notasoma,nninteger:array[1..6] of integer;
notamedia:array[1..6] of real;
notastring:array[1..6] of string[4];
vet:vetor;
a,b,c,d,e, posiv,np,ii,tot,tc,tt:integer;
numf,num:string[4];

const
inidis:array[1..6] of integer=(5, 9, 13, 17, 21 ,25);
fimdis:ARRAY[1..6] of integer=(8, 12, 16, 20, 24, 28);

//===================== programa principal
Begin
  assign(arq,'cand.ind');
  assign(notas,'notas.txt');
  reset(notas);
  reset(arq);
  //o arquivo falta soh possui o num de inscr, logo o acesso serah por num
  //ta montando um vetor pelo num de inscrição pra comparar com o num de inscrição de quem faltou
  repeat
    read(arq,reg);
    ii:=a+1;          //ii=indice do vetor
    vet[ii].pf:=a;    //a=posicao fisica do registro no arquivo
    str(reg.num,num);
    tc:=length(num);
    for b:=1 to 4-tc do
    insert('0',num,1);  //insere zeros a esquerda para ficar compativel com o numero lido em faltas
    vet[ii].cc:=num;
    a:=a+1;
  until(eof(arq));
  
  tot:=ii;
  writeln('ordenando...');
  writeln('por favor, aguarde');
  ordem(vet,ii);
  writeln(' ENTER PARA CONTINUAR');
  
  repeat
    tt:=tt+1;
    readln(notas,reg2);
    numf:=copy(reg2,1,4);  //copiando a nota no registro do arquivo 2
    pebin1(vet,numf,tot,posiv);  // busca binária dentro da lista
    seek(arq,vet[posiv].pf);  //procura no arquivo 1 (cand) o vetor da posição fisica
    read(arq,reg);
    for d:=1 to 6 do
    begin
      notastring[d]:=copy(reg2,inidis[d],fimdis[d]); // copia em notastring o conteudo na posição indicada
      val(notastring[d],nninteger[d],e);  //transforma em inteiro
      reg.notas[d]:= nninteger[d];
      notasoma[d]:=notasoma[d] + nninteger[d];
    end;  
    
    reg.som:=0;
    
    for d:=1 to 6 do
    reg.som:=reg.som+nninteger[d];
    
    seek(arq,vet[posiv].pf);
    write(arq,reg);
    
  until eof (notas);
  
  for d:=1 to 6 do
  notamedia[d]:=notasoma[d]/tt;
  clrscr;
  
  writeln(' total de --',tt:5,' candidatos');
  writeln('DISCIPLINAS                        MEDIA');
  writeln('L.E.M                              ', notamedia[1]:2:2);
  writeln('Matemática                         ', notamedia[2]:2:2);
  writeln('Lógica                             ', notamedia[3]:2:2);
  writeln('CEC                                ', notamedia[4]:2:2);
  writeln('Informática                        ', notamedia[5]:2:2);
  writeln('Atualidades                        ', notamedia[6]:2:2);
  
  termine;
  close(arq);
  close(notas);
End.