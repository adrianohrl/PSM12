function y = g21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	g1 = x1.*x3 - 5*x4.*x5;
	y = [g1]; % Restrições de igualdade da questão 21
end