clc
clear all
% initial conditions

n=100;
for i = 1 : n/2+1
  x(i)  = i-1;
  Uo(i) = i/2 ;
end

for i = n/2+1 : n 
  x(i)  = i-1;
  Uo(i) = -i/2+n/2 ;
end
plot(x,Uo,'r');
