p = zeros(21,21) %criação da matriz 20x20 preenchida por zeros
p (5:6,9:13)=10
p (11:12,7:15)=50
p (16:17,10:12)=30

contourf(p)