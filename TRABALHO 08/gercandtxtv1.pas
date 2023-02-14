Program gercandtxtv1 ;
{versao 1
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
 arq:text;      //NOME LÓGICO DO ARQUIVO (SERÁ TIPO TEXTO - ACESSO SEQUENCIAL)
 reg:string[60];  //REGISTRO SERÁ DE 60 CARACTERES
 num,car,dd,mm,aa,a,b,c:integer;
 nome:string[35];
 cpf:string[11];
 numa,anoa:string[4];
 dda,mma,caa:string[2];
Begin
 assign(arq,'sai1.txt');    //LIGA NOME LÓGICO AO FÍSICO
 append(arq);               //ABRE PARA ACRESCENTAR REGISTROS (SÓ TIPO TEXTO ACESSO/ORGANIZAÇÃO SEQUENCIAL)
 leia1('numero',num);
 while (num > 0) do
  begin
   str(num,numa);        //TRANFORMA NUM INTEGER EM STRING[4]
   write('nome=>');
   readln(nome);
   nome:=upcase(nome);
   write('cpf=>');
   readln(cpf);
   leia1('dia',dd);
   leia1('mes',mm);
   leia1('ano',aa);
   leia1('cargo',car);
   str(dd,dda);       //TRASNFORMA DIA EM STRING[2]
   str(mm,mma);       //TRASNFORMA MES EM STRING[2]
   str(aa,anoa);      //TRASNFORMA ANO EM STRING[4]
   str(car,caa);      //TRASNFORMA CARGO EM STRING[2]
//insiro os campos strings no registro de traz para frente inserindo sempre na pos 1
   insert(caa,reg,1);   //12
   insert(anoa,reg,1);  //199912
   insert(mma,reg,1);   //10199912
   insert(dda,reg,1);   //0510199912
   insert(cpf,reg,1);   //123456789540510199912
   insert(nome,reg,1);  //MARIA DO ROSARIO BATISTA           123456789540510199912
   insert(numa,reg,1);  //0033MARIA DO ROSARIO BATISTA           123456789540510199912
//DEVERIA FICAR COMO ACIMA, ABRA O ARQUIVO SAI1.TXT, DEPOIS DE ENCERRAR, E CONFIRA
   writeln(arq,reg);    //GRAVA O REGISTRO
   leia1('numero',num);
  end;
  close(arq);
  termine;
End.