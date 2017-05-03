function solution = redBi(fname, a, b, epsilon, k_max)
	tic();
	if a >= b
		error('a must be lesser than b!!!');
	end;
	k = 1;
	while abs(b - a) > epsilon
		t = (b - a) / 4;
		x0 = a + 2 * t;
		x1 = a + t;
		x2 = a + 3 * t;
		fx0 = feval(fname, x0);
		fx1 = feval(fname, x1);
		fx2 = feval(fname, x2);
		if fx2 > fx0 && fx0 > fx1
			b = x2;
		elseif fx2 < fx0 && fx0 < fx1
			a = x1;
		elseif fx1 > fx0 && fx2 > fx0
			a = x1;
			b = x2;
		end;
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	solution = x0;
	tf = toc();
	disp(['   x* = ' num2str(solution)]);
	disp(['   e  = ' num2str(abs(b - a))]);
	disp(['   k  = ' num2str(k)]);
	disp(['   tf = ' num2str(tf)]);
end
