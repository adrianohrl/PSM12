clc;
clear all;
close all;

%% Dados para o uso da Função de Rosenbrock (x* = [1; 1]), 
% está função não é possível ser escrita na forma quadrática
name = 'de Rosenbrock';
x0 = [0.9; 0.9];
a1 = a2 = -5;
b1 = 5; b2 = 6;

epsilon = 1e-5;
k_max = 500;
tam = 50;
x1 = linspace(a1, b1, tam);
x2 = linspace(a2, b2, tam);
z = zeros(tam);
for i = 1 : tam
	z(i, :) = f([x1(i) * ones(1, tam); x2]);
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
	[solution fsolution e k tf alpha] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
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
	[solution fsolution e k tf alpha] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
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

disp('Método de Quasi-Newton:');
try
	[solution fsolution e k tf] = quasiNewton(@f, @gf, x0, 0.75, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método dos Gradientes Conjugados usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = gc(@f, @gf, x0, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
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
	[solution fsolution e k tf alpha] = gc(@f, @gf, x0, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
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
	[solution fsolution e k tf] = regConf(@f, @gf, x0, 0.2, 2, 5, epsilon, k_max, @pontoCauchy);
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
	[solution fsolution e k tf] = regConf(@f, @gf, x0, 0.2, 2, 5, epsilon, k_max, @passoNewton);
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
	[solution fsolution e k tf] = regConf(@f, @gf, x0, 0.2, 2, 5, epsilon, k_max, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) redBi(fname, a, b, epsilon, k_max)));
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
	[solution fsolution e k tf] = regConf(@f, @gf, x0, 0.2, 2, 5, epsilon, k_max, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max)));
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