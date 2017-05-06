clc;
clear all;
close all;

a = -1;
b = Inf;
x = load('dados7.csv');
n = length(x);
a_str = num2str(a);
if isinf(a)
	a_str = '\infty';
	if a < 0
		a_str = ['-' a_str];
	end;
end;
b_str = num2str(b);
if isinf(b)
	b_str = '\infty';
	if b < 0
		b_str = ['-' b_str];
	end;
end;
plot(1 : n, x);
title(['Amostras coletadas para estimação dos parâmetros da NT(\mu, \sigma^2; ' a_str ', ' b_str ')']);
xlabel('amostra');
ylabel('valor');
grid on;

l = @(theta) -l_nt(theta, a, b, x);
gl = @(theta) -gl_nt(theta, a, b, x);
theta0 = [mean(x); var(x)];
epsilon = 1e-3;
k_max = 1000;
a_mu = -1; a_sigma2 = epsilon;
b_mu = 1; b_sigma2 = 1;
tam = 100;
mu = linspace(a_mu, b_mu, tam);
sigma2 = linspace(a_sigma2, b_sigma2, tam);
llf = zeros(tam);
for i = 1 : tam
	for j = 1 : tam
		llf(i, j) = -l([mu(i); sigma2(j)]);
	end;
end;
figure;
mesh(mu, sigma2, llf);
title(['Log-Likelihood Function']);
xlabel('\mu');
ylabel('\sigma^2');
zlabel('l(\theta)');
grid on;

addpath('../mnouvsr');
addpath('../mnomvsr');

disp('Método de Máxima Declividade usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = maxDecl(l, gl, theta0, epsilon, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['   theta*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp([' l(theta*) = ' num2str(fsolution)]);
	disp(['     e     = ' num2str(e)]);
	disp(['     k     = ' num2str(k)]);
	disp(['     tf    = ' num2str(tf)]);
	disp(['   alpha   = [' num2str(alpha) ']']);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método de Máxima Declividade usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = maxDecl(l, gl, theta0, epsilon, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['   theta*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp([' l(theta*) = ' num2str(fsolution)]);
	disp(['     e     = ' num2str(e)]);
	disp(['     k     = ' num2str(k)]);
	disp(['     tf    = ' num2str(tf)]);
	disp(['   alpha   = [' num2str(alpha) ']']);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método de Quasi-Newton:');
try
	[solution fsolution e k tf] = quasiNewton(l, gl, theta0, 0.75, epsilon, epsilon, k_max);
	disp(['   theta*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp([' l(theta*) = ' num2str(fsolution)]);
	disp(['     e     = ' num2str(e)]);
	disp(['     k     = ' num2str(k)]);
	disp(['     tf    = ' num2str(tf)]);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método dos Gradientes Conjugados usando o método de Redução Bilateral:');
try
	[solution fsolution e k tf alpha] = gc(l, gl, theta0, epsilon, k_max, @(fname, a, b) redBi(fname, a, b, epsilon, k_max));
	disp(['   theta*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp([' l(theta*) = ' num2str(fsolution)]);
	disp(['     e     = ' num2str(e)]);
	disp(['     k     = ' num2str(k)]);
	disp(['     tf    = ' num2str(tf)]);
	disp(['   alpha   = [' num2str(alpha) ']']);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

disp('Método dos Gradientes Conjugados usando o método de Interpolação Quadrática:');
try
	[solution fsolution e k tf alpha] = gc(l, gl, theta0, epsilon, k_max, @(fname, a, b) interQuad(fname, a, b, epsilon, k_max));
	disp(['   theta*  = [' num2str(solution(1)) '; ' num2str(solution(2)) ']']);
	disp([' l(theta*) = ' num2str(fsolution)]);
	disp(['     e     = ' num2str(e)]);
	disp(['     k     = ' num2str(k)]);
	disp(['     tf    = ' num2str(tf)]);
	disp(['   alpha   = [' num2str(alpha) ']']);
catch err
	disp(['  error: ' err.message]);
end;
disp('');

rmpath('../mnouvsr');
rmpath('../mnomvsr');