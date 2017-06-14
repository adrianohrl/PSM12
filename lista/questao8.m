clc;
clear all;
close all;
warning off;

%% Dados para o uso da Função da questão 8 (x1* = [1/sqrt(3); 1/sqrt(3)], x2* = [-1/sqrt(3); -1/sqrt(3)]),
% está função não é possível ser escrita na forma quadrática
name = 'da questão 8';
x0 = [0.5; 0.5];
a1 = a2 = -1.5;
b1 = b2 = 1.5;

epsilon_f = 1e-3;
epsilon_x = 1e-5;
k_max = 500;
tam = 100;
x1 = linspace(a1, b1, tam);
x2 = linspace(a2, b2, tam);
z = zeros(tam);
for i = 1 : tam
	for j = 1 : tam
		x3_2 = 1 - x1(i)^2 - x2(j)^2;
		if x3_2 >= 0
			z(i, j) = f8([x1(i); x2(j)]);
		end;
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

disp('Método de Máxima Declividade usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = maxDecl(@f8, @gf8, x0, epsilon_f, epsilon_x, k_max, @(fname, a, b) redBi(fname, a, b, epsilon_f, k_max));
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

disp('Método de Máxima Declividade usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = maxDecl(@f8, @gf8, x0, epsilon_f, epsilon_x, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon_f, k_max));
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

disp('Método de Newton:');
try
	[solution fsolution e k tf] = newton(@gf8, @hf8, x0, epsilon_f, epsilon_x, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

c1 = 0.1;
delta_alpha = 0.05;

disp('Método de Quasi-Newton:');
try
	[solution fsolution e k tf] = quasiNewton(@f8, @gf8, x0, c1, delta_alpha, epsilon_f, epsilon_x, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método dos Gradientes Conjugados usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = gc(@f8, @gf8, x0, epsilon_f, k_max, @(fname, a, b) redBi(fname, a, b, epsilon_f, k_max));
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

disp('Método dos Gradientes Conjugados usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = gc(@f8, @gf8, x0, epsilon_f, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon_f, k_max));
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

disp('Método da Região de Confiança usando o método do ponto de Cauchy:');
try
	[solution fsolution e k tf] = regConf(@f8, @gf8, x0, 0.2, 2, 5, epsilon_f, k_max, @pontoCauchy);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método da Região de Confiança usando o método de passo de Newton:');
try
	[solution fsolution e k tf] = regConf(@f8, @gf8, x0, 0.2, 2, 5, epsilon_f, k_max, @passoNewton);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método da Região de Confiança usando o método Dog Leg com o método de Redução Bilateral:');
try
	[solution fsolution e k tf] = regConf(@f8, @gf8, x0, 0.2, 2, 5, epsilon_f, k_max, @(gf8x, hf8x, delta) dogleg(gf8x, hf8x, delta, @(fname, a, b) redBi(fname, a, b, epsilon_f, k_max)));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método da Região de Confiança usando o método Dog Leg com o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf] = regConf(@f8, @gf8, x0, 0.2, 2, 5, epsilon_f, k_max, @(gf8x, hf8x, delta) dogleg(gf8x, hf8x, delta, @(fname, a, b) interQuad(fname, a, b, epsilon_f, k_max)));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

rmpath('../mnouvsr');
rmpath('../mnomvsr');