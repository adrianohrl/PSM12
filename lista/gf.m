function y = gf(x)
	x1 = x(1, :);
	x2 = x(2, :);
	y = [-400*x1.*(x2 - x1.^2) - 2*(1 - x1); 200*(x2 - x1.^2)]; % Gradiente da Função de Rosenbrock
end