function y = gf21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	df_dx1 = x2.*x3.*x4.*x5.*exp(x1.*x2.*x3.*x4.*x5) - 3*x1.*(x1.^3 + x2.^3+1).^2;
	df_dx2 = x1.*x3.*x4.*x5.*exp(x1.*x2.*x3.*x4.*x5) - 3*x2.*(x1.^3 + x2.^3+1).^2;
	df_dx3 = x1.*x2.*x4.*x5.*exp(x1.*x2.*x3.*x4.*x5);
	df_dx4 = x1.*x2.*x3.*x5.*exp(x1.*x2.*x3.*x4.*x5);
	df_dx5 = x1.*x2.*x3.*x4.*exp(x1.*x2.*x3.*x4.*x5);
	y = [df_dx1; df_dx2; df_dx3; df_dx4; df_dx5]; % Gradiente da Função da questão 21
end