clc;
clear all;
close all;

name = 'da Questão 3';
x0 = [-1; 1];
Q = [2 5; 5 2];
c = [-1; -1];
f = @(x) 0.5 * x' * Q * x - c' * x;
gf = @(x) Q * x - c;
hf = @(x) Q;
a1 = a2 = -10;
b1 = b2 = 10;

epsilon = 1e-5;
k_max = 500;
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

addpath('../mnouvsr');
addpath('../mnomvsr');

disp('Método de Newton:');
try
	[solution fsolution e k tf] = newton(@gf, @hf, x0, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método de Máxima Declividade para uma Função Quadrática:');
try
	[solution fsolution e k tf alpha] = maxDeclQuad(Q, c, x0, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['   alpha = [' num2str(alpha) ']']);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

rmpath('../mnouvsr');
rmpath('../mnomvsr');