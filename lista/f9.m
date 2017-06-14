function y = f9(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x5 = x(4, :);
	y = sin(x1 + x2) + x3.^2 + 1/3*x5.^4 + 1/9*(3/4 - 33/8*x1 - 3*x2 - 8/3*x3 - 19/8*x5); % Função da questão 9
end