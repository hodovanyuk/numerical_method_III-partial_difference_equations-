clc
clear all

%nodes
n = 100;

% boundary value
x0 = 0;
x1 = 0;

%step in space
h = 1/n;

%step in  time
dt=0.01;

% initial conditions
U=zeros(1,n);
for i = 1 : n/2
  Uo(i) = i/2 ;
end
for i = 1 : n/2+1
  Uo(n-i) = i/2 ;
end
% Ut + a*Ux = b*Uxx 
a = 10;
b = 0.001 ;

%simplify computation
A = 1/dt ;
B = a/(4*h) ;
C = b/(2*h^2) ;

steps = 100;
for i = 1 : n
    x(i) = x0 + i*h;
end


for step = 1:steps
  Uoo=Uo;
  Uo = U;
  for i = 2 : n-1
      a(i) = -B - C ;
      b(i) = A + 2*B ;
      c(i) = B - C ; 
      d(i) = Uo(i)*(A-2*C) + Uo(i+1)*(-B+C) + Uo(i-1)*(B+C) ; 
  end
 
  c(1) = B - C ;
  b(1) = A + 2*B ;
  a(1) = -B - C ; 
  d(1) = Uo(i)*(A-2*C) + Uo(i+1)*(-B+C) ; 

  c(n) = B - C ;
  b(n) = A + 2*B ;
  a(n) = -B - C ; 
  d(n) = Uo(i)*(A-2*C) + Uo(i-1)*(B+C) ; 

  d(1) = d(1) - a(1)*x0;
  a(1) = 0;

  d(n) = d(n) - c(n)*x1;
  c(n) = 0;
  
  U = progonka(a, b, c, d);
  time = time + dt;
  plot(x,U,'r')
  pause (.1)
  grid on
end
