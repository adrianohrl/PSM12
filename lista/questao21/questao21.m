clc;
clear all;
close all;
warning off;

%% Dados para o uso da Função de questão 21,
% está função não é possível ser escrita na forma quadrática
name = 'da questão 21';
%x0 = [1; 0; 2.75; 0.003; 0.003];
x0 = [1; 1; 1; 1; 1];
a1 = a2 = -1.5;
b1 = b2 = 1.5;

epsilon = 1e-5;
k_max = 500;

addpath('../../mnouvsr');
addpath('../../mnomvsr');
addpath('../../mnomvsr/copia');

disp('Conjuntos Ativos com Método de Programação Quadrática:');
try
	[solution fsolution e k tf] = conjuntoAtivo(@f21, @g21, @h21, @gf21, @gg21, @gh21, x0, epsilon, k_max);
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) '; ' num2str(solution(3)) '; ' num2str(solution(4)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

rmpath('../../mnouvsr');
rmpath('../../mnomvsr');
rmpath('../../mnomvsr/copia');