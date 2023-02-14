Program N10; {Gabriel Chioquetta Obladen      PARTE 1

FUP que atualize os campos CLG (classificação geral), CLC (classificação no cargo) 
e CCL (cargo de classificação) no arquivo CAND.IND, conforme critérios da folha anterior.}
USES BIBLIONT;
 

CONST VAGAS : ARRAY[1..12] OF INTEGER = (20,15,17,18,15,20,14,12,17,18,17,20);
CONST DATAFUT = 20220101;

VAR   nota_s: string[3] ; 
			AGE: string[6]; 
			dat: string[8];
      vet: vetor;  
			vetclacar: ARRAY[1..12] OF INTEGER; 
			NOTA: array[1..6] of string[3];
      ARQ: FILE OF REGIS; 
			REG: REGIS;
      I,A,B,dati,err,TOT,id_i,contclger,cont_cla,tc: integer;
     

BEGIN
	ASSIGN(ARQ, 'CAND.IND');
  RESET(ARQ);
  
  REPEAT
  	READ(ARQ,REG);
   		I:= A+1;   
	 		vet[I].pf:= A;
	 		A:= A+1; 
   
	 IF reg.falta = 1 THEN 
	 vet[I].cc:= '                    desclassificado'  
   
	 ELSE              
   	BEGIN{2}
   		str(reg.som:3,nota_s); 
			vet[I].cc:= nota_s;    
		
    for B:= 1 to 6 do    
		  BEGIN{3}
    		str(reg.notas[b]:3,nota_s); 
	   		NOTA[B]:= nota_s; 
		  END;{3}
    
		INSERT(reg.data.dia,dat,1);
		INSERT(reg.data.mes,dat,1);
		INSERT(reg.data.ano,dat,1);
 
    val(dat,dati,err);        
    id_i:= DATAFUT - dati;  
    str(id_i,AGE);         
    vet[I].cc:= vet[I].cc + NOTA[4] + NOTA[5] + NOTA[3] + NOTA[2] + NOTA[6] + NOTA[1] + AGE;
	 END;{2}
	 	        
  UNTIL(EOF(ARQ));  
  
  TOT:= I;        
  for A:= 1 to 20 do
  
	writeln(vet[A].pf:5,' ',vet[A].cc);
	writeln('Ordenando, aguarde...');
 	ordem(vet,TOT);
  writeln('Fim da ordenação!');
  
  for A:= TOT downto (TOT-20) do  
	 writeln('pf ',vet[A].pf:5,' -campo chave: ',vet[A].cc); 
	 

  FOR A:= TOT DOWNTO 1 DO
  	BEGIN{4}
  		SEEK(ARQ,vet[A].pf);
   		READ(ARQ,REG);
   		
   		IF reg.falta = 0 THEN
 				BEGIN{5}
   				contclger:= contclger + 1;     
		 			reg.clg:= contclger;           
		 			vetclacar[reg.car]:= vetclacar[reg.car] + 1;  
		 			reg.clc:= vetclacar[reg.car];   
		 
			IF(vetclacar[reg.car] <= vagas[reg.car]) THEN 
		 		BEGIN{6}
		 			cont_cla:= cont_cla + 1;
		  		reg.ccl:= reg.car; 
			  END;{6}
		                                                                                              
		  SEEK(ARQ,vet[A].pf);
		  WRITE(ARQ,REG);
		 		END;{5} 
	  END;{4} 
    
  	CLOSE(ARQ);
  	WRITELN('Total de classificados:',cont_cla:8);
  	termine;
    
END.