clear
clc


C = 6
L = 6
elem = [1 C+2 C+1; 1 2 C+2; 2 3 C+2; 3 C+3 C+2]

elem_lin = 2*C-2
num_elem = C*L


for i=5:elem_lin
    for j=1:3
        elem (i,j)=elem(i-4,j)+2
             
        j=j+1
    end
    i=i+1
    end
for l=1:L-2
    
    if mod (l,2) ==1
        
    elem (l*elem_lin+1,:) = [l*C+1; l*C+2; (l+1)*C+1]
    elem (l*elem_lin+2,:) = [l*C+2; (l+1)*C+2; (l+1)*C+1]
    elem (l*elem_lin+3,:) = [l*C+2; (l+1)*C+3; (l+1)*C+2]
    elem (l*elem_lin+4,:) = [l*C+2; l*C+3; (l+1)*C+3]
    
    else
    elem (l*elem_lin+1,:) = [l*C+1; (l+1)*C+2; (l+1)*C+1]
    elem (l*elem_lin+2,:) = [l*C+1; l*C+2; (l+1)*C+2]
    elem (l*elem_lin+3,:) = [l*C+2; l*C+3; (l+1)*C+2]
    elem (l*elem_lin+4,:) = [l*C+3; (l+1)*C+3; (l+1)*C+2]
    
    end
  for i=l*elem_lin+5:l*elem_lin+(2*C-2)
    for j=1:3
        
            elem (i,j)=elem(i-4,j)+2
      
            
        j=j+1
    end
    i=i+1
  end  
    l=l+1
end


for i=1:L
    for j=1:C
        nos((i*C)+j-C,1)= j
        nos((i*C)+j-C,2)= L-(i-1)
        
        
        j=j+1
    end
    i=i+1
end
















