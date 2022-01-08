clc
clear

elem = [1 5 2; 4 5 1; 7 5 4; 8 5 7; 2 5 3; 5 6 3; 5 9 6; 8 9 5]
nos = [1 3; 1 2; 1 1; 2 3; 2 2; 2 1; 3 3; 3 2; 3 1]


for i=1:size (elem,1)   
   l(i)=elem(i,1)
   m(i)=elem(i,2)
   n(i)=elem(i,3)
   
p(i,l(i))=nos(