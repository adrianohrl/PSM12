function y = gf8(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3_2 = 1 - x1.^2 - x2.^2;
	df_dx1 = -8*x2./sqrt(x3_2).*(2*x1.^2 + x2.^2 - 1);
	df_dx2 = -8*x1./sqrt(x3_2).*(x1.^2 + 2*x2.^2 - 1);
	y = [df_dx1; df_dx2]; % Gradiente da Função da questão 8
end