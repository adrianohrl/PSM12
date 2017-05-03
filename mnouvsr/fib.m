function solution = fib(fname, a, b, n, epsilon, k_max)
	tic();
	if a >= b
		error('a must be lesser than b!!!');
	end;
	if n <= 0
		error('n must be positive!!!');
	end;
	k = 1;
	for j = 2 : n
		L1 = b - a;
		if abs(L1) <= epsilon
			break;
		end;
		L2 = fibonacci(n - j) / fibonacci(n - j + 2) * L1;
		if L2 > L1 / 2
			x1 = b - L2;
			x2 = a + L2;
		else
			x1 = a + L2;
			x2 = b - L2;
		end;
		fx1 = feval(fname, x1);
		fx2 = feval(fname, x2);
		if fx1 >= fx2
			a = x1;
		end;
		if fx2 >= fx1
			b = x2;
		end;
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	solution = x1;
	tf = toc();
	disp(['   x* = ' num2str(solution)]);
	disp(['   e  = ' num2str(abs(b - a))]);
	disp(['   k  = ' num2str(k)]);
	disp(['   tf = ' num2str(tf)]);
end
