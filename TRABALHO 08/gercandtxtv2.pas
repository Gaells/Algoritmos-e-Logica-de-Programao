Program gercandtxtv2 ;
{versao 2
LER DO TECLADO ,NUM:4,NOME:35,CPF:11,NASC:8,CARGO:2 (1<->12) , num total de 60 caracteres
e criar um arquivo tipo texto (acesso sequencial - SAI1.TXT), 
com as informações lidas e o lay-out abaixo. num<1, encerra a leitura.
{01-04=NUMERO
 05-39=NOME
 40-50=CPF
 51-58=NASCIMENTO
 59-60=CARGO}
uses bibliont;
var
 arq:text; //NOME LÓGICO DO ARQUIVO (SERÁ TIPO TEXTO - ACESSO SEQUENCIAL)
 reg:string[60];    //REGISTRO SERÁ DE 60 CARACTERES
 num,car,dd,mm,aa,a,b,c:integer;
 nome:string[35];
 cpf:string[11];
 numa,anoa:string[4];
 dda,mma,caa:string[2];
Begin
 assign(arq,'sai1.txt');
 append(arq);
 leia1('numero',num);
 while (num > 0) do
  begin
   str(num,numa);    //TRANFORMA NUM (INTEGER) EM STRING[4] E VAMOS INSERIR ZEROS A ESQUERDA
   b:=length(numa);   //PEGA A QUANTIDADE DE CARACTERES EM NUMA
   for a:=1 to 4-b do  //SE DIGITADO 7, B=1, LOGO, A VAI DE 1 ATE 4-1(3)
    insert('0',numa,1);  //INSERE TRES ZEROS NA FRENTE DO 7
   write('nome=>');
   readln(nome);
   nome:=upcase(nome); //VAMOS INSERIR ESPAÇOS À DIREITA DO NOME
   b:=length(nome);    //PEGA A QUANTIDADE DE CARACTERES EM NOME
   for a:=b+1 to 35 do
    insert(' ',nome,a); //INSERE ESPAÇOS À DIREITA DO NOME A PARTIR DE TOTAL DE CARACTERES+1, ATEH 35
   write('cpf=>');
   readln(cpf);
   leia1('dia',dd);
   leia1('mes',mm);
   leia1('ano',aa);
   leia1('cargo',car);
   str(dd,dda);
   if(dd<10) then
    insert('0',dda,1);  //INSERE ZERO A EQUERDA DO DIA SE MENOR QUE 10
   str(mm,mma);
   if(mm<10) then
    insert('0',mma,1);  //INSERE ZERO A EQUERDA DO MES SE MENOR QUE 10
   str(aa,anoa);
   str(car,caa);
   if(car<10) then      //INSERE ZERO A EQUERDA DO CARGO SE MENOR QUE 10
    insert('0',caa,1);
//insiro os campos strings no registro de traz para frente inserindo sempre na pos 1
   insert(caa,reg,1);
   insert(anoa,reg,1);
   insert(mma,reg,1);
   insert(dda,reg,1);
   insert(cpf,reg,1);
   insert(nome,reg,1);
   insert(numa,reg,1);
   writeln(arq,reg);
//ABRA O ARQUIVO SAI1.TXT, DEPOIS DE ENCERRAR, E CONFIRA
   leia1('numero',num);
  end;
  close(arq);
  termine;
End.