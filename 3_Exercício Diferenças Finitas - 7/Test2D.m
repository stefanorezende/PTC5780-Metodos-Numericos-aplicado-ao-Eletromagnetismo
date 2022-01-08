p = zeros(10,10) %criação da matriz 10x10 preenchida por zeros
p(1,:)=10 %primeira linha da matriz = 10 V
n = 1
i = 1
j = 1
Vc = 0% potencial do condutor
p(5,4)= Vc
p(5,5)= Vc
p(5,6)= Vc
p(5,7)= Vc
p(6,4)= Vc
p(6,5)= Vc
p(6,6)= Vc
p(6,7)= Vc
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
            
                Vc = (p(4,4)+p(4,5)+p(4,6)+p(4,7)+p(5,3)+p(5,8)++p(6,3)+p(6,8)+p(7,4)+p(7,5)+p(7,6)+p(7,7))/12 %cálculo do potencial do condutor
            
p(5,4)= Vc
p(5,5)= Vc
p(5,6)= Vc
p(5,7)= Vc
p(6,4)= Vc
p(6,5)= Vc
p(6,6)= Vc
p(6,7)= Vc
        end
       
    j = j +1
    end
    i = i+1
    end
n = n+1
end


contourf(p,30)
