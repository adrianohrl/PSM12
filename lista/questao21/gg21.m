function y = gg21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	dL_dx1 = 0;
	dL_dx2 = x3;
	dL_dx3 = x2;
	dL_dx4 = -5*x5;
	dL_dx5 = -5*x4;
	y = [dL_dx1; dL_dx2; dL_dx3; dL_dx4; dL_dx5]; % Gradiente da Função da questão 21
end