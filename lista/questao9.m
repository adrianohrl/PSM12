clc;
clear all;
close all;
warning off;

%% Dados para o uso da Função de questão 9,
% está função não é possível ser escrita na forma quadrática
name = 'da questão 9';
x0 = [0; 0; 0; 0];
a1 = a2 = -1.5;
b1 = b2 = 1.5;

epsilon = 1e-5;
k_max = 500;

addpath('../mnouvsr');
addpath('../mnomvsr');

disp('Método de Máxima Declividade usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = maxDecl(@f9, @gf9, x0, epsilon, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf alpha] = maxDecl(@f9, @gf9, x0, epsilon, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = newton(@gf9, @hf9, x0, epsilon, 1e-8, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = quasiNewton(@f9, @gf9, x0, 0.75, epsilon, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf alpha] = gc(@f9, @gf9, x0, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf alpha] = gc(@f9, @gf9, x0, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = regConf(@f9, @gf9, x0, 0.2, 2, 5, epsilon, k_max, @pontoCauchy);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = regConf(@f9, @gf9, x0, 0.2, 2, 5, epsilon, k_max, @passoNewton);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = regConf(@f9, @gf9, x0, 0.2, 2, 5, epsilon, k_max, @(gf9x, hf9x, delta) dogleg(gf9x, hf9x, delta, @(fname, a, b) redBi(fname, a, b, epsilon, k_max)));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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
	[solution fsolution e k tf] = regConf(@f9, @gf9, x0, 0.2, 2, 5, epsilon, k_max, @(gf9x, hf9x, delta) dogleg(gf9x, hf9x, delta, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max)));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
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