function y = f(x)
	x1 = x(1, :);
	x2 = x(2, :);
	y = 100*(x2 - x1.^2 ).^2 + (1 - x1).^2; % Função de Rosenbrock
end