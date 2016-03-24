clc
clear all
n = 100;
x0 = 0;
x1 = 1;
h = (x1-x0)/(n + 1);
dt=0.01;

T=zeros(1,n);
time=0;

for i = 1 : n
    x(i) = x0 + i*h;
end
while time < 1
To=T;
for i = 1 : n
    a(i) = 1/h^2;
    b(i) = 2/h^2 + 1/dt;
    c(i) = 1/h^2; 
    d(i) = -To(i)/dt; 
end

d(1) = d(1) + a(1)*h;
b(1) = b(1)-a(1);
a(1) = 0;


d(n) = d(n) - c(n)*1;
c(n) = 0;
hold on


T = progonka(a, b, c, d);
time = time + dt;
plot(x,T,'r')

grid on
end
