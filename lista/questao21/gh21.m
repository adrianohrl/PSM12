function y = gh21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	dL_dx1 = [2*x1 3*x1.^2];
	dL_dx2 = [2*x2 3*x2.^2];
	dL_dx3 = [2*x3 0];
	dL_dx4 = [2*x4 0];
	dL_dx5 = [2*x5 0];
	y = [dL_dx1; dL_dx2; dL_dx3; dL_dx4; dL_dx5]; % Gradiente da Função da questão 21
end