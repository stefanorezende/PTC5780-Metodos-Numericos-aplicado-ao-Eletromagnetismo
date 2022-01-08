p = zeros(20,20) %criação da matriz 10x10 preenchida por zeros
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
p(9,11)=Vc
p(9,12)=Vc
p(9,13)=Vc
p(9,14)=Vc
p(10,7)=Vc
p(10,8)=Vc
p(10,9)=Vc
p(10,10)=Vc
p(10,11)=Vc
p(10,12)=Vc
p(10,13)=Vc
p(10,14)=Vc
p(11,7)=Vc
p(11,8)=Vc
p(11,9)=Vc
p(11,10)=Vc
p(11,11)=Vc
p(11,12)=Vc
p(11,13)=Vc
p(11,14)=Vc
p(10,7)=Vc
p(12,8)=Vc
p(12,9)=Vc
p(12,10)=Vc
p(12,11)=Vc
p(12,12)=Vc
p(12,13)=Vc
p(12,14)=Vc

for n=1:100 %numero de iterações

    for i=1:size(p,1)
        
    for j=1:size(p,2)
        
        if i-1 <1 %condição de contorno da borda superior (placa de 10V)
            continue
        elseif i+1>size(p,2)%condição de contorno da borda inferior (placa de 0V)
            continue
        elseif j-1 <1 %condição de contorno da borda esquerda
           p(i,j)= (p(i-1,j)+p(i+1,j)+p(i,j+1))/3 %utiliza o ponto da coluna posterior espelhado à esquerda
        
        elseif j+1>size(p,1) %condição de contorno da borda direita
           p(i,j)= (p(i-1,j)+p(i+1,j)+p(i,j-1))/3 %utiliza o ponto da coluna anterior espelhado à direita
        
                
        else
            p(i,j)= (p(i-1,j)+p(i+1,j)+ p(i,j-1)+p(i,j+1))/4 %cálculo dos demais pontos do reticulado
            
Vc = (p(8,7)+p(8,8)+p(8,9)+p(8,10)+p(8,11)+p(8,12)+p(8,13)+p(8,14)+p(9,6)+p(9,15)+p(10,6)+p(10,15)+p(11,6)+p(11,15)+p(12,6)+p(12,15)+p(13,7)+p(13,8)+p(13,9)+p(13,10)+p(13,11)+p(13,12)+p(13,13)+p(13,14))/24 %cálculo do potencial do condutor
            
p(9,7)=Vc
p(9,8)=Vc
p(9,9)=Vc
p(9,10)=Vc
p(9,11)=Vc
p(9,12)=Vc
p(9,13)=Vc
p(9,14)=Vc
p(10,7)=Vc
p(10,8)=Vc
p(10,9)=Vc
p(10,10)=Vc
p(10,11)=Vc
p(10,12)=Vc
p(10,13)=Vc
p(10,14)=Vc
p(11,7)=Vc
p(11,8)=Vc
p(11,9)=Vc
p(11,10)=Vc
p(11,11)=Vc
p(11,12)=Vc
p(11,13)=Vc
p(11,14)=Vc
p(12,7)=Vc
p(12,8)=Vc
p(12,9)=Vc
p(12,10)=Vc
p(12,11)=Vc
p(12,12)=Vc
p(12,13)=Vc
p(12,14)=Vc
        end
       
    j = j +1
    end
    i = i+1
    end
n = n+1
end

contourf(p,25)