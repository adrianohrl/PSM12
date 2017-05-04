clc;
clear all;
close all;

x0 = [-2; 2];
epsilon = 1e-5;
k_max = 50;
a = -4;
b = 4;
tam = 50;
x1 = x2 = linspace(a, b, tam);
tz = size(tam);
for i = 1 : tam
	z(i, :) = f([x1(i) * ones(1, tam); x2]);
end;
mesh(x1, x2, z);
title('Função teste');
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
grid on;

addpath('../mnouvsr');

disp('Testando o método de Máxima Declividade usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end

disp('Testando o método de Máxima Declividade usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf] = maxDecl(@f, @gf, x0, epsilon, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['     x*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end
disp('');

rmpath('../mnouvsr');