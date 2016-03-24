clc
clear all
n = 100;
x0 = 0;
x1 = 1;
h = (x1-x0)/(n + 1);
dt=0.01;
counst = -10;

T=zeros(1,n);
time=0;

for i = 1 : n
    x(i) = x0 + i*h;
end
for step = 0:2
    
    To=T;
    a(1) = 1;
    b(1) = -2/(2*h^2);
    c(1) = -2/(2*h^2);
    
    for i = 2 : n-1
        a(i) = 1/dt+2/h^2; % ó(³-1)
        b(i) = -2/(2*h^2);
        c(i) = b(i);
        d(i) = -c(i)*T(i-1)+(1/dt+b(i)+c(i))*T(i)-b(i)*T(i+1); %  = "ó"" +- ó" +-ó = ..."
    end

   d(1) = d(1) + a(1)*h;
   

 c(n) = 0;
    d(n) = 0;
   
    b(n) = 0;
    a(n) = 1; 
    hold on
    T = progonka(a, b, c, d);
    time = time + dt;
    hold on
    plot(x,T,'g')
    grid on
end
