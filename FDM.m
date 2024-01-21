clc
clearvars

a = 0;
b = 1;
 n = 4;
 h = (b-a)/(n*1.0);
 y = 0;
 y(1) = a;
 y(n+1) = b;
 
 for j = 1:100
 for i = 2:n
     y(i) = (h*h+y(i+1)+y(i-1))/(2-h*h);
 end
 end