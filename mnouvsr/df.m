function y = df(x)
	y = 1.5 * x ./ (1 + x .^ 2) .^ 2 + 0.65 * x ./ (1 + x .^ 2) - 0.65 * atan(1 ./ x);
end