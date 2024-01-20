clc
clearvars

a = 0;
b = 2;

n = 10;

h = (b-a)/(n*1.0);

f = @(t, y) y - t^2 + 1;

y(1)=0.5;

for i = 1:3;
    ti = a + (i-1)*h;
    k1 = h*f(ti,y(i));
    k2 = h*f(ti + h/2, y(i)+k1/2);
    k3 = h*f(ti + h/2, y(i)+k2/2);
    k4 = h*f(ti + h, y(i)+k3);
    y(i+1) = y(i) + (k1 + 2*k2 + 2*k3 +k4)/6;
end

for i = 4:n;
     ti = a + (i-1)*h;
    yp = y(i) + (h/24)*(55*f(ti,y(i))-59*f(ti-h,y(i-1))+37*f(ti-2*h,y(i-2))-9*f(ti-3*h,y(i-3)) );
    y(i+1) = y(i) + (h/24)*( 9*f(ti+h,yp) + 19*f(ti,y(i)) - 5*f(ti-h,y(i-1)) + f(ti-2*h,y(i-2))  );
end
syms t
exact_sol = (t + 1)^2 - 0.5 * exp(t);

for i = 1 : n+1
     ti = a + (i-1)*h;
    exact = subs(exact_sol, ti);
    fprintf("t: %0.2f \ty: %0.7f\t exact: %0.7f \t error %0.9f \n", a+(i-1)*h, y(i), exact, abs(y(i)-exact));
end

ti = a:h:b;
plot(ti,y)