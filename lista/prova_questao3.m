clc;
clear all;
close all;

name = 'da Questão 3';
x0 = [-1; 1];
Q = [0 0; 0 0];
c = [2; -1];
f = @(x) 0.5 * x' * Q * x - c' * x;
gf = @(x) Q * x - c;
hf = @(x) Q;
a1 = a2 = -10;
b1 = b2 = 10;

tam = 100;
x1 = linspace(a1, b1, tam);
x2 = linspace(a2, b2, tam);
z = size(tam);
for i = 1 : tam
	for j = 1 : tam
		z(i, j) = f([x1(i); x2(j)]);
	end;
end;
mesh(x1, x2, z);
title(['Função ' name]);
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
grid on;