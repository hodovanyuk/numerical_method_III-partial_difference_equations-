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

for step = 0 : 1
    To=T;
    for i = 1 : n
        a(i) = (1 / i) * (1 / h^2) * ((i + i+1)/2); % y(i-1)
        c(i) = ((1 / i) * (1 / h^2) * ((i + i-1)/2)); % y(i+1)
        b(i) = a(i) + c(i) ;% y(i)
        d(i) = - To(i) / dt; 
    end
    
    d(1) = d(1) + a(1)*h;
    b(1) = b(1) - a(1);
    if b(i) == 0
        i;
        break;
    end
    a(1) = 0;
    d(n) = d(n) ;
    c(n) = 0;
  
    hold on
    T = progonka(a, b, c, d);
    time = time + dt;
    plot(x,T,'r')
    grid on
end
