clc;
clear all;
close all;

%% Dados para o uso da Função Teste (x* = [0; 0])
name = 'Teste';
x0 = [-2; 2];
Q = [2 0; 0 10];
c = [0; 0];
a1 = a2 = -4;
b1 = b2 = 4;

%% Dados para o uso da Função Teste (x* = [1; 1])
% name = 'de Rosenbrock';
% x0 = [0.9; 0.9];
% Q = ''; % não existe
% c = ''; % não existe
% a1 = a2 = -2;
% b1 = 2; b2 = 6;

epsilon = 1e-5;
k_max = 500;
tam = 50;
x1 = linspace(a1, b1, tam);
x2 = linspace(a2, b2, tam);
tz = size(tam);
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

disp('Testando o método de Máxima Declividade usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['   alpha = [' num2str(alpha) ']']);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Máxima Declividade usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['   alpha = [' num2str(alpha) ']']);
catch err
	warning(err.identifier, err.message);
end;
disp('');

if ~isempty(Q) && ~isempty(c)
	disp('Testando o método de Máxima Declividade para uma Função Quadrática:');
	try
		[solution fsolution e k tf alpha] = maxDeclQuad(Q, c, x0, epsilon, epsilon, k_max);
		disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
		disp(['   f(x*) = ' num2str(fsolution)]);
		disp(['     e   = ' num2str(e)]);
		disp(['     k   = ' num2str(k)]);
		disp(['     tf  = ' num2str(tf)]);
		disp(['   alpha = [' num2str(alpha) ']']);
	catch err
		warning(err.identifier, err.message);
	end;
	disp('');
end;

disp('Testando o método de Newton:');
try
	[solution fsolution e k tf] = newton(@gf, @hf, x0, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Quasi-Newton:');
try
	[solution fsolution e k tf] = quasiNewton(@f, @gf, x0, 0.75, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método dos Gradientes Conjugados usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = gc(@f, @gf, x0, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(f(solution))]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['   alpha = [' num2str(alpha) ']']);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método dos Gradientes Conjugados usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = gc(@f, @gf, x0, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['   alpha = [' num2str(alpha) ']']);
catch err
	warning(err.identifier, err.message);
end;
disp('');

if ~isempty(Q) && ~isempty(c)
	disp('Testando o método dos Gradientes Conjugados para uma Função Quadrática:');
	try
		[solution fsolution e k tf alpha] = gcQuad(Q, c, x0, epsilon, k_max);
		disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
		disp(['   f(x*) = ' num2str(f(solution))]);
		disp(['     e   = ' num2str(e)]);
		disp(['     k   = ' num2str(k)]);
		disp(['     tf  = ' num2str(tf)]);
		disp(['   alpha = [' num2str(alpha) ']']);
	catch err
		warning(err.identifier, err.message);
	end;
	disp('');
end;

rmpath('../mnouvsr');