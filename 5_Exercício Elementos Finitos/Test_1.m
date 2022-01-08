%Todos elementos e nós 
clc
clear

elem = [1 5 2; 1 4 5; 4 7 5; 7 8 5; 2 5 3; 5 6 3; 5 9 6; 5 9 8] % nós de cada elemento
    %  [1 5 2; 4 5 1; 7 5 4; 8 5 7; 2 5 3; 5 6 3; 5 9 6; 8 9 5]sequencia de nós adotada anteriormente 
nos = [1 3; 1 2; 1 1; 2 3; 2 2; 2 1; 3 3; 3 2; 3 1] %coordenadas dos nós

%delta = ones(3,3)

%elem = [1 5 2]
%nos = [1 3; 1 2; 1 1; 2 3; 2 2]

%Iniciando o cálculo dos valores de p, q e r
%Já usando a referencia global dos nós
for i=1:8
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
end %resulta em matriz (numero de elementos x numero de nós) no caso, 8x9


k=zeros (9:9)

for n = 1:size(elem,1)%varre elemento por elemento
    ke=zeros (9:9)%cria e zera a matriz K para cada elemento
for s=1:3%
    for t=1:3
    ke(elem(n,s),elem(n,t))= (q(n,elem(n,s))*q(n,elem(n,t))+r(n,elem(n,s))*r(n,elem(n,t)))
    
    t=t+1
    end
    s=s+1
end
  k = k + ke
    n=n+1
end
    
    
    iguald= zeros(9,1)
    iguald (5,1)=10
    iguald (1,1)=5
    iguald (9,1)=-5
    %[0; -2; 0; -2; 10; -2; 0; -2; 0] 
    k(5,:)=0
    %k(:,5)=0
    k(5,5)=1
    k(1,:)=0
    k(1,1)=1
    k(9,:)=0
    k(9,9)=1
    
    phi=inv(k)*iguald
    
    
    
    