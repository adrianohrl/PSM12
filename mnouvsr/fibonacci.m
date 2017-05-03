function solution = fibonacci(n)
	if n < 3
		solution = 1;
		return;
	end;
	F = ones(1, n);
	for k = 3 : n
		F(k) = F(k - 2) + F(k - 1);
	end;
	solution = F(n);
end