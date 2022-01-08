clear
coord=[6 3003 3004; 8 3003 3004; 10 3003 3004; 12 3003 3004; 14 3003 3004; 6 3001 3000; 8 3001 3000; 10 3001 3000; 12 3001 3000; 14 3001 3000; 8 1003 1004; 10 1003 1004; 12 1003 1004; 8 1001 1000; 10 1001 1000; 12 1001 1000]

m= [1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; 1 -1 0; ] 
    
qlin=coord.*m
qlin (:,3)=[]

eps=8.85*10^-12
V1 = 1000
V2 = 0

for i=1:size(coord,1)
    
    for j=1:size(coord,1)
        r(i,j)=sqrt((coord(i,1)-coord(j,1))^2+(coord(i,3)-coord(j,2))^2)
        j=j+1
    
    end
    
        i=i+1
end

for i=1:size(coord,1)
    
    for j=1:size(coord,1)
        rlin(i,j)=sqrt((coord(i,1)-qlin(j,1))^2+(coord(i,3)-qlin(j,2))^2)
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
plin (:,17)=0 %cria coluna
plin (11:16,17)=-1

plin (17,:)=0 %cria linha
plin (17, 11:16)=1
        
iguald = zeros (17,1)
iguald (1:10,1)=1000

Q=inv(plin)*iguald
        
        
        
        
        
