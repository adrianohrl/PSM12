function [fun] = myfun(x)
%Função objetivo

fun = exp(x(1)*x(2)*x(3)*x(4)*x(5))-(1/2)*(x(1)^3 + x(2)^3 + 1)^2;