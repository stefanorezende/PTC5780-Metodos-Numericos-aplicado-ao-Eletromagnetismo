


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





dcoluna=1;
dlinha=0;

for interacao = 1:10

    
    for j= 1:8 % varredura da linha

        for i= 1:8 % vareeudra da coluna
                     if (dlinha ~=1)&& (dlinha~=5)  % dlinha diferente de  1 pois será  onde tera o potencial e  diferente de  5 será onde terá a interface.
             
                        a= matriz_inicial(2+dlinha,dcoluna);    % deslocamento no sentido x (coluna)
                        b= matriz_inicial(2+dlinha,(dcoluna+2)); % deslocamento no sentido x (coluna )
                        c= matriz_inicial(1+dlinha,dcoluna+1);  % deslocamento no sentido  y
                        d= matriz_inicial(3+dlinha,(dcoluna+1)); % deslocamento no sentido y
                        
                        matriz_inicial(2+dlinha,(1+dcoluna))= (a+b+c+d)/4; % valor do ponto
                        
                     end   
                    
                    if ((dlinha==1) && (dcoluna<2 | dcoluna>6)) % se for no ponto do potencial dado nao deve alterar , faz a media em torno do potencial e preenche 
                        
                        a= matriz_inicial(2+dlinha,dcoluna);
                        b= matriz_inicial(2+dlinha,(dcoluna+2));
                        c= matriz_inicial(1+dlinha,dcoluna+1);
                        d= matriz_inicial(3+dlinha,(dcoluna+1));  
                        
                         matriz_inicial(2+dlinha,(1+dcoluna))= (a+b+c+d)/4;   % valor do ponto                     
                    end      
                    
                    if (dlinha == 5 ) % onde  tera  a interface Episoln A e0 , episolon B 6e0
                        
                        % trocado os nomes de indice  das  variaveis  para
                        % compatibilizar  com a formula de interface ;
                        epsA= 1;
                        epsB=10;
                        
                        b= matriz_inicial(2+dlinha,dcoluna);
                        d= matriz_inicial(2+dlinha,(dcoluna+2));  
                        a= matriz_inicial(1+dlinha,dcoluna+1);
                        c= matriz_inicial(3+dlinha,(dcoluna+1)); 
                                                
                       matriz_inicial(2+dlinha,(1+dcoluna))= (epsB*a)/(2*(epsA+epsB)) + (b/4) + (d/4) + (epsA*c)/(2*(epsA+epsB)); 
                        
                                              
                    end
                    
         
             dcoluna=dcoluna+1;
   
        end
        
        dlinha = dlinha+1;
        dcoluna=1;
    end
    
  dcoluna=1;
  dlinha=0;
        
end
d=99;