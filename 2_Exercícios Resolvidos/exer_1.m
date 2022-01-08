


for i=1:10
    for j=1:10
         matriz_inicial(i,j)=0;
    end
end


matriz_inicial(3,3)=10;
matriz_inicial(3,4)=10;
matriz_inicial(3,5)=10;
matriz_inicial(3,6)=10;
matriz_inicial(3,7)=10;



matriz_inicial(1,1)=3;
matriz_inicial(1,2)=4;
matriz_inicial(1,3)=10;
matriz_inicial(1,4)=18;
matriz_inicial(3,7)=7;


matriz_inicial(3,3)=10;
matriz_inicial(3,4)=10;
matriz_inicial(3,5)=10;
matriz_inicial(3,6)=10;
matriz_inicial(3,7)=10;


dcoluna=1;
dlinha=0;

for interacao = 1:10

    for j= 1:8 % varredura da linha

     for i= 1:8 % vareeudra da coluna
        
         a= matriz_inicial(2+dlinha,dcoluna);
         b= matriz_inicial(2+dlinha,(dcoluna+2));
         c= matriz_inicial(1+dlinha,dcoluna+1);
         d= matriz_inicial(3+dlinha,(dcoluna+1));
   
            matriz_inicial(2+dlinha,(1+dcoluna))= (a+b+c+d)/4;
   
             dcoluna=dcoluna+1;
   
        end
        
    dlinha = dlinha+1;
    dcoluna=1;
    end
    
  dcoluna=1;
  dlinha=0;
        
end
d=99;