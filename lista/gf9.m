function y = gf9(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x5 = x(4, :);
	df_dx1 = cos(x1 + x2) - 11/24;
	df_dx2 = cos(x1 + x2) - 1/3;
	df_dx3 = 2*x3 - 8/27;
	df_dx5 = 4/3*x5 + 19/72;
	y = [df_dx1; df_dx2; df_dx3; df_dx5]; % Gradiente da Função da questão 9
end