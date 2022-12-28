program ordenasel;

const nmax=50;

var

  v: array[1..nmax] of integer;

  i,j,n,posMenor,temp: integer;

begin

  writeln('Digite um inteiro menor ou igual a ' ,nmax, ' :  '); 
	readln(n);
	writeln('Digite ',n,' inteiros separados por espacos');

  for i:=1 to n do read(v[i]);

  for i:=1 to n-1 do begin

   posMenor:=i;

   for j:=i+1 to n do

     if v[j] < v[posMenor] then posMenor := j;

     if i <> posMenor then begin

     temp := v[i];

     v[i] := v[posMenor];

     v[posMenor] := temp;

    end;

  end;

  writeln;

  for i:=1 to n do  write(v[i]:4);

end.