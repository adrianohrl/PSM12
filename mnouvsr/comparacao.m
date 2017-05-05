%% Comparação entre os métodos numéricos de otimização para uma única variável sem restrição

clc;
clear all;
close all;

epsilon = 1e-5;
k_max = 150;
a = 1e-5;
b = 2;
x = a : 1e-5 : b;
y = f(x);
plot(x, y);
title('Função teste');
xlabel('x');
ylabel('f(x)');
grid on;

disp('Testando o método de Redução Unilateral:');
try
	[solution fsolution e k tf] = redUni(@f, a, b, .95, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Redução Bilateral:');
try
	[solution fsolution e k tf] = redBi(@f, a, b, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de busca Fibonacci:');
try
	[solution fsolution e k tf] = fib(@f, a, b, 100, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Golden Section:');
try
	[solution fsolution e k tf] = gs(@f, a, b, 100, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf] = interQuad(@f, a, b, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Newton:');
try
	[solution fsolution e k tf msg] = newton(@df, @d2f, a, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
	disp(['     ' msg]);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Quasi Newton:');
try
	[solution fsolution e k tf] = quasiNewton(@f, 1e-2, 0.8, epsilon, k_max);
	disp(['     x*  = ' num2str(solution)]);
	disp(['   f(x*) = ' num2str(fsolution)]);
	disp(['     e   = ' num2str(e)]);
	disp(['     k   = ' num2str(k)]);
	disp(['     tf  = ' num2str(tf)]);
catch err
	warning(err.identifier, err.message);
end;
disp('');
