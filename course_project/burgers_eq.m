clc
clear all
n = 100;
x0 = 0;
x1 = 1;
h = (x1-x0)/(n + 1);
dt=0.01;
k = 1;
ro  = dt/(4*h);
r = (k*dt)/(2*(h)^2);


T=zeros(1,n);
time=0;

for i = 1 : n
    x(i) = x0 + i*h;
end
for step = 0:9
    
    To=T;

    for i = 2 : n-1
        a(i) = -r-ro*To(i); % ó(³-1)
        b(i) = 2*r+1+ro*T(i+1)-ro*To(i-1);% ó(³)
        c(i) = -r+ro*To(i);%  ó(³+1)
        d(i) = r*To(i+1)+(1-2*r)*To(i)+r*To(i-1); %  = "ó"" +- ó" +-ó = ..."
    end

    d(1) = d(1) + a(1)*h;
    b(1) = 0;
    c(1) = 0;
    a(1) = 0;

a(n) = 0;
b(n) = 0;
    d(n) = d(n-1) - c(n-1)*1;
    c(n) = 0;

    hold on
    T = progonka(a, b, c, d);
    time = time + dt;
    hold on
    plot(x,T,'g')
    grid on
end
