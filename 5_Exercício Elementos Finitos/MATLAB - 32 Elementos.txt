clear
clc


C = 5 %numero de colunas 
L = 5 %numero de linhas
elem = [1 C+2 C+1; 1 2 C+2; 2 3 C+2; 3 C+3 C+2] %calculo dos nós pertencentes aos primeiros quatro elementos da primeira linha

elem_lin = 2*C-2 %numero de elementos em cada linha
Tot_elem = (L-1)*(2*C-2) %total de elementos no reticulado
Tot_nos = C*L %total de nós no reticulado


for i=5:elem_lin %determina os nós dos elementos da primeira linha
    for j=1:3
        elem (i,j)=elem(i-4,j)+2 %i-4 para se basear no triangulo na mesma rotação
             
        j=j+1
    end
    i=i+1
    end
for l=1:L-2 %determina os nós dos elementos das demais linhas
    
    if mod (l,2) ==1 %verifica se a linha é impar ou par, influencia na rotação do primeiro trianguloa
        
    elem (l*elem_lin+1,:) = [l*C+1; l*C+2; (l+1)*C+1] %calculo dos nós pertencentes aos primeiros quatro elementos das linhas impares
    elem (l*elem_lin+2,:) = [l*C+2; (l+1)*C+2; (l+1)*C+1]
    elem (l*elem_lin+3,:) = [l*C+2; (l+1)*C+3; (l+1)*C+2]
    elem (l*elem_lin+4,:) = [l*C+2; l*C+3; (l+1)*C+3]
    
    else
    elem (l*elem_lin+1,:) = [l*C+1; (l+1)*C+2; (l+1)*C+1] %calculo dos nós pertencentes aos primeiros quatro elementos das linhas pares
    elem (l*elem_lin+2,:) = [l*C+1; l*C+2; (l+1)*C+2]
    elem (l*elem_lin+3,:) = [l*C+2; l*C+3; (l+1)*C+2]
    elem (l*elem_lin+4,:) = [l*C+3; (l+1)*C+3; (l+1)*C+2]
    
    end
  for i=l*elem_lin+5:l*elem_lin+(2*C-2)%determina os nós dos demais elementos das linhas
    for j=1:3
        
            elem (i,j)=elem(i-4,j)+2
      
            
        j=j+1
    end
    i=i+1
  end  
    l=l+1
end %fecha os laços de determinação de nós de cada elemento do reticulado, resulatanto numa matriz de numero_de_elementos X 3_nós


for i=1:L %calcula as coordenadas de cada nó.
    for j=1:C
        nos((i*C)+j-C,1)= j
        nos((i*C)+j-C,2)= L-(i-1)
        
        
        j=j+1
    end
    i=i+1
end %fecha os laços das coordenadas dos nós, resultando numa matriz numero_de_nos x 2_coordenadas

for i=1:Tot_elem %calculo de p,q e r de cada elemento
for j=1:3
 
if j==1 %L
p(i,elem(i,j))=nos(elem(i,j+1),1)*nos(elem(i,j+2),2)-nos(elem(i,j+2),1)*nos(elem(i,j+1),2) %j+1 = M; j+2 = N
q(i,elem(i,j))=nos(elem(i,j+1),2)-nos(elem(i,j+2),2)
r(i,elem(i,j))=nos(elem(i,j+2),1)-nos(elem(i,j+1),1)

elseif j==2 %M
p(i,elem(i,j))=nos(elem(i,j+1),1)*nos(elem(i,j-1),2)-nos(elem(i,j-1),1)*nos(elem(i,j+1),2) %j-1 = L; j+1 = N
q(i,elem(i,j))=nos(elem(i,j+1),2)-nos(elem(i,j-1),2)
r(i,elem(i,j))=nos(elem(i,j-1),1)-nos(elem(i,j+1),1)

elseif j==3 %N
p(i,elem(i,j))=nos(elem(i,j-2),1)*nos(elem(i,j-1),2)-nos(elem(i,j-1),1)*nos(elem(i,j-2),2)%j-2 = L; j-1 = M
q(i,elem(i,j))=nos(elem(i,j-2),2)-nos(elem(i,j-1),2)
r(i,elem(i,j))=nos(elem(i,j-1),1)-nos(elem(i,j-2),1)

end

j=j+1

end


i=i+1
end %resulta em matriz (numero_de_elementos x numero_de_nós) 


k=zeros (Tot_nos:Tot_nos) %cria a matriz K

for n = 1:size(elem,1)%varre elemento por elemento
    ke=zeros (Tot_nos:Tot_nos)%cria e zera a matriz K para cada elemento
for s=1:3%
    for t=1:3
    ke(elem(n,s),elem(n,t))= (q(n,elem(n,s))*q(n,elem(n,t))+r(n,elem(n,s))*r(n,elem(n,t)))%calculo da matriz K de cada elemento
    
    t=t+1
    end
    s=s+1
end
  k = k + ke %soma a matriz K de cada elemento à matriz K global
    n=n+1
end
    
    
    iguald= zeros(Tot_nos,1)%cria matriz igualdade
    iguald (17:19,1)=10 %condição de contorno da matriz igualdade
    
  %condições de contorno para caixa aterrada
    k(1:6,:) = 0 
    k(10:11,:) = 0 
    k(15:16,:) = 0 
    k(20:25,:) = 0 
   
    k(1,1)=1
    k(2,2)=1
    k(3,3)=1
    k(4,4)=1
    k(5,5)=1
    k(6,6)=1
    k(10,10)=1
    k(11,11)=1
    k(15,15)=1
    k(16,16)=1
    k(20,20)=1
    k(21,21)=1
    k(22,22)=1
    k(23,23)=1
    k(24,24)=1
    k(25,25)=1
    
    %condições de contorno para fita 10V
    
    k(17:19,:)=0
    k(17,17)=1
    k(18,18)=1
    k(19,19)=1
    
    
    %Calculo dos potenciais
    phi=inv(k)*iguald












