v = [2 3004; 4 3004; 2 3000; 4 3000; 2 2004; 4 2004; 2 2000; 4 2000; 2 1004; 4 1004; 2 1000; 4 1000]
q = [2 3003; 4 3003; 2 3001; 4 3001; 2 2003; 4 2003; 2 2001; 4 2001; 2 1003; 4 1003; 2 1001; 4 1001]

m= [1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1  -1; 1  -1; 1  -1; 1  -1; 1  -1]
%vlin=v.*m
qlin=q.*m

eps=8.85*10^-12
V1 = 1000
V2 = 0

for i=1:size(v,1)
    
    for j=1:size(q,1)
        
        r(i,j)=sqrt((v(i,1)-q(j,1))^2+(v(i,2)-q(j,2))^2)
        j=j+1
    
    end
    
        i=i+1
end

for i=1:size(v,1)
    
    for j=1:size(q,1)
        
        rlin(i,j)=sqrt((v(i,1)-qlin(j,1))^2+(v(i,2)-qlin(j,2))^2)
        j=j+1
    
    end
    
        i=i+1
end

for i=1:size(r,1)
    for j=1:size(rlin,2)
        p(i,j)= 1/(2*pi)*log(rlin(i,j)/r(i,j))
        
        j=j+1
    end
    i=i+1
end
 
plin = p
plin (:,13)=0 %cria coluna
plin (9:12,13)=-1

plin (13,:)=0 %cria linha
plin (13, 9:12)=1
        
resul = zeros (13,1)
resul (1:4,1)=1000

x=inv(plin)*resul
        
        
        
        
        
