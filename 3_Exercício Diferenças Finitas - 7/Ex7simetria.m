p = zeros(20,10) %criação da matriz 10x10 preenchida por zeros
p(1,:)=10 %primeira linha da matriz = 10 V
n = 1
i = 1
j = 1
Vc = 0% potencial inicial do condutor

%definindo os pontos do condutor flutuante
p(9,7)=Vc
p(9,8)=Vc
p(9,9)=Vc
p(9,10)=Vc
p(10,7)=Vc
p(10,8)=Vc
p(10,9)=Vc
p(10,10)=Vc
p(11,7)=Vc
p(11,8)=Vc
p(11,9)=Vc
p(11,10)=Vc
p(10,7)=Vc
p(12,8)=Vc
p(12,9)=Vc
p(12,10)=Vc

for n=1:500 %numero de iterações

    for i=1:size(p,1)
        
    for j=1:size(p,2)
        
        if i-1 <1 %condição de contorno da borda superior (placa de 10V)
            continue
        elseif i+1>size(p,1)%condição de contorno da borda inferior (placa de 0V)
            continue
        elseif j-1 <1 %condição de contorno da borda esquerda
           p(i,j)= (p(i-1,j)+p(i+1,j)+p(i,j+1))/3 
        
        elseif j+1>size(p,2) %condição de contorno da borda direita
           p(i,j)= (p(i-1,j)+p(i+1,j)+p(i,j-1))/3 
        
               
        else
            p(i,j)= (p(i-1,j)+p(i+1,j)+ p(i,j-1)+p(i,j+1))/4 %cálculo dos demais pontos do reticulado
            
            Vc = (p(8,7)+p(8,8)+p(8,9)+p(8,10)+p(9,6)+p(10,6)+p(11,6)+p(12,6)+p(13,7)+p(13,8)+p(13,9)+p(13,10))/12 %cálculo do potencial do condutor
            
p(9,7)=Vc
p(9,8)=Vc
p(9,9)=Vc
p(9,10)=Vc
p(10,7)=Vc
p(10,8)=Vc
p(10,9)=Vc
p(10,10)=Vc
p(11,7)=Vc
p(11,8)=Vc
p(11,9)=Vc
p(11,10)=Vc
p(12,7)=Vc
p(12,8)=Vc
p(12,9)=Vc
p(12,10)=Vc
        end
       
    j = j +1
    end
    i = i+1
    end
n = n+1
end

contourf(p,26)