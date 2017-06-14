clc;
clear all;
close all;

name = 'da Questão 3';
x0 = [-1; 1];
Q = [2 0; 0 2];
c = [-2; -6];
f = @(x) 0.5 * x' * Q * x + c' * x;
gf = @(x) Q * x + c;
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

A = [-0.5 -0.5; 1 -2];
b = [-1; -5];

p_x1 = -1/3;
p_x2 = 7/3;
[p(1, :) i] = sort(p(1, :));
p(2, :) = p(2, i);
figure;
fill(p(1,:)',p(2,:), 'r');
hold on;
grid on;

x1c = 2;
x2c = 5;
ra = sqrt(29);
rb = sqrt(29);
t = 0 : .01 : 2 * pi;
x1 = ra * cos(t) + x1c;
x2 = rb * sin(t) + x2c;
plot(x1, x2);