function y = gf(x)
	x1 = x(1, :);
	x2 = x(2, :);
	y = [2*x1; 10*x2]; % Gradiente da Função Teste
end