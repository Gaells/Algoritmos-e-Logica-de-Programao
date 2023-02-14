Program buscanome ;
//luiz antonio profe
//programa para procurar e mostrar o(s) registro(s) de "cand.ind" do nome digitado, fim encerra o programa.
//
uses BIBLIONT;
var arq:file of regis;
    reg:regis;
    var ext,nomecc:a35;
        vet: vetor;
        ini,fim,a,b,tot,tc,posind,posfi:integer;
//======================================
PROCEDURE pebin2(vet:vetor;ext:tipo;t:integer;VAR posi:INTEGER);
//vet, ext, t por valor e posi por referencia, parametros formais
// o resultado da tarefa eh devolvido em posi
// vet possui duas informações por posicao o campo chave e a posicao fisica
//
var a,ini,fim,meio,XX,ts:integer; //variaveis locais
    strmeio:a35;
		achou:boolean;
begin
 achou:=false;
 XX:=0;
 ini:=1;
 fim:=t;
//completa ext com espaços a direita
 ts:=length(ext);
 for a:=ts+1 to 35 do
  insert(' ',ext,a);
 repeat
  meio:=(ini+fim) div 2;
//retire de vet[meio].cc apenas os caracteres correspondentes ao ts (total de caracteres em ext)
  strmeio:=copy(vet[meio].cc,1,ts);
//completa strmeio com espaços a direita
  for a:=ts+1 to 35 do
   insert(' ',strmeio,a);
 if(ext = strmeio)then
	  achou:=true
  else
   if(ext > strmeio)then
    ini:=meio+1
   else
    fim:=meio-1;
 until ((achou) OR (ini > fim));
 if( achou ) then
  posi := meio
 else
  posi := 0;
end;
//==========================================
Begin
 assign(arq,'cand.ind');
 reset(arq);
//monta o vetor de índices
  repeat
   read(arq,reg);
   tot:=tot+1;      //tot conta lidos e eh índice vetor
   vet[tot].pf:=a;  //a indica a posicao fisica (PF) do registro em CAND.IND
   vet[tot].cc:=reg.nome;
   a:=a+1;
  until eof(arq);
//fim da montagem do vetor
 writeln('ordenando');
 ordem(vet,tot);
 writeln('ordenado');
 write('digite o nome a procurar=>');
 readln(ext);
 ext:=upcase(ext);
 while ext <> 'FIM' do
  begin
   pebin2(vet,ext,tot,posind);
   if(posind<>0)then
    begin 
     writeln('ocorrencia encontrada via pesquisa binaria em:');
		 writeln(vet[posind].cc,' -- ',ext,' indice vetor=',posind:6,' pos.fisica no arq=',vet[posind].pf:6);
		 writeln('enter para continuar');
		 readln;
//como existem homonimos no arquivo e não sei qual encontrou, procura a ocorrencia
//de ext no vetor para traz de posind e para frente de posind
     tc:=length(ext);
     for a:=tc+1 to 35 do
      insert(' ',ext,a);
		 ini:=posind;
		 fim:=posind;
		 if(ini>1)then
//procura a primeira ocorrencia de diferente de ext no vetor, para traz
		  repeat
		   ini:=ini-1;
		   nomecc:=vet[ini].cc;
			 for a:=tc+1 to 35 do
			  insert(' ',nomecc,a);
		  until(ext<>nomecc) or (ini=1);
		 if(fim<tot)then
//procura a primeira ocorrencia de diferente de ext no vetor, para frente
		  repeat
		   fim:=fim+1;
		   nomecc:=vet[fim].cc;
			 for a:=tc+1 to 35 do
			  insert(' ',nomecc,a);
		  until(ext<>nomecc) or (fim=tot);
//mostra os registros com o mesmo elemento ext com a primeira e ultima ocorrencia diferente
     if(ini>1)then
      ini:=ini+1; //acrescenta 1 à ini, pois ini contem o primeiro diferente antes.
     if(fim<tot)then
      fim:=fim-1; //retira 1 de fim, pois fim contem o primeiro diferente após.
     for a:=ini to fim do
      begin
       seek(arq,vet[a].pf);
       read(arq,reg);
       writeln(reg.num:5,' ',reg.nome,' ',reg.cpf,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,' ',reg.car:2,vet[a].pf:5);
      end;
   end
     else
      writeln('NAO ENCONTRADO');
 	 writeln;
	 write('digite o nome a procurar=>');
   readln(ext);
   ext:=upcase(ext);
  end; 
 close(arq);
 termine; 
End.