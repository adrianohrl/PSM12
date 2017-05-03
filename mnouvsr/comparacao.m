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
title('Função teste')
xlabel('x');
ylabel('f(x)');
grid on;

disp('Testando o método de Redução Unilateral:');
try
	redUni(@f, a, b, .95, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end
disp('');

disp('Testando o método de Redução Bilateral:');
try
	redBi(@f, a, b, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de busca Fibonacci:');
try
	fib(@f, a, b, 100, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Golden Section:');
try
	gs(@f, a, b, 100, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Interpolação Quadrática:');
try
	interQuad(@f, a, b, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Newton:');
try
	newton(@df, @d2f, a, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');

disp('Testando o método de Quasi Newton:');
try
	quasiNewton(@f, 1e-2, a, epsilon, k_max);
catch err
	warning(err.identifier, err.message);
end;
disp('');
