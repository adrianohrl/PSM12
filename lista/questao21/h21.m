function y = h21(x)
	x1 = x(1, :);
	x2 = x(2, :);
	x3 = x(3, :);
	x4 = x(4, :);
	x5 = x(5, :);
	h1 = x1.^2 + x2.^2 + x3.^2 + x4.^2 + x5.^2 - 10;
	h2 = x1.^3 + x2.^3 - 1;
	y = [h1; h2]; % Restrições de desigualdade da questão 21
end