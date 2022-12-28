program ordenanomes;

(**********************************************************************

 algoritmo de selacao para ordenar nomes em ordem alfabética.

**********************************************************************)

const nmax=50;

var

  v: array[1..nmax] of string;

  i,j,n,posMenor: integer;

  temp:string;

begin

  writeln('Digite um inteiro menor ou igual a ' ,nmax, ' :  '); readln(n);

  writeln('Digite ',n,' strings, uma em cada linha);

  for i:=1 to n do readln(v[i]);

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

  for i:=1 to n do  writeln(v[i]);

end.