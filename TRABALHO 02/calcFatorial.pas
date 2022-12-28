Program Pzim ;
uses crt;

var num:integer;
		user: string;
		
	  function calcFatorial(num : integer) : integer;
							var fatorial, i: integer;
begin{0}
     
		 
		 fatorial:=1;
		 for i:=1 to num do
		 begin{1}
		 		fatorial := fatorial * i;
		 end;{1}
		 calcFatorial:= fatorial;
end{0};

procedure askData ( nome : string ) ;
var idade: integer;
		sexo: string;
begin{2}
			writeln('Olá ', nome, ' gostaria de lhe fazer algumas perguntas');
			writeln('Qual a sua idade ?');
			readln(idade);
			writeln('Qual o seu sexo ?');
			readln(sexo);
			writeln('Qual o número que vc gostaria de descobrir o fatorial ?');
			readln(num);
			writeln(num, ' ! = ', calcFatorial(num));
end;{2}

BEGIN 
			writeln('Digite seu nome:');
			readln(user);
			askData(user);
			readln;
END.