function y = f21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	y = exp(x1.*x2.*x3.*x4.*x5) - 0.5*(x1.^3 + x2.^3+1).^2; % Função da Questão 21
end