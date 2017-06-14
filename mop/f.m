function y = f(x, b)

	n = size(b, 2);
	y = zeros(n, 1);
	for i = 1 : n
		y(i) = quad(x, b(:, i));
	end;
	
end