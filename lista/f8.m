function y = f8(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3_2 = 1 - x1.^2 - x2.^2;
	y = -8*x1.*x2.*sqrt(x3_2); % Função da questão 8
end