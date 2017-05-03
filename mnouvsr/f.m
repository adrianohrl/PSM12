function y = f(x)
	y = 0.65 - 0.75 ./ (1 + x .^ 2) - 0.65 * x .* atan(1 ./ x);
end