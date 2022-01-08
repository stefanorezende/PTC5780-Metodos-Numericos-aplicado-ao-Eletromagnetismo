v = [2 20; 4 20; 2 16; 4 16; 2 5; 4 5; 2 1; 4 1]
q = [2 19; 4 19; 2 17; 4 17; 2 4; 4 4; 2 2; 4 2]

m= [1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1 -1; 1  -1]
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
        
        
    
        
        
        
        
        
        
        
