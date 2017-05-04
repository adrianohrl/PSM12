function y = f(x)
	x1 = x(1, :);
	x2 = x(2, :);
	y = x1 .^ 2 + 5 * x2 .^ 2;
end