clc
clear all
% node number
n = 100;
% boundary value
x0 = 0;
x1 = 0;
% step in space
h = 1/n;
% step in time
dt=0.01;

k = 1;
U=zeros(1,n);
time=0;

for i = 1 : n
    x(i) = x0 + i*h;
end

for i = 1 : n/2+1
  x(i)  = i-1;
  U00(i) = i/2 ;
end

for i = n/2+1 : n 
  x(i)  = i-1;
  U00(i) = -i/2+n/2 ;
end

for  step =  0 : 20
U00 = U;
U0 = U00 +dt;

for i = 1 : n
    a(i) = 1/(h^2);
    b(i) = 2/h^2+1/dt;
    c(i) = a(i); 
    d(i) = -2*U0(i)/dt+U00(i)/dt^2; 
end

d(1) = d(1) - a(1)*x0;
a(1) = 0;


d(n) = d(n) - c(n)*x1;
c(n) = 0;



U = progonka(a, b, c, d);
time = time + dt;
if mod(step,2) == 0

else
plot(x,U,'g')
end
pause (.1)
grid on
end
