function solution = quasiNewton(fname, delta_x, x0, epsilon, k_max)
	tic();
	x(1) = x0;
	k = 1;
	while true
		_fx(k) = feval(fname, x(k) - delta_x);
		fx(k) = feval(fname, x(k));
		fx_(k) = feval(fname, x(k) + delta_x);
		dfx(k) = (fx_(k) - _fx(k)) / (2 * delta_x);
		if abs(dfx(k)) <= epsilon
			break;
		end;
		x(k + 1) = x(k) - delta_x ^ 2 * dfx(k) / (_fx(k) - 2 * fx(k) + fx_(k));
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	solution = x(k);
	tf = toc();
	disp(['   x* = ' num2str(solution)]);
	disp(['   e  = ' num2str(abs(fx(k)))]);
	disp(['   k  = ' num2str(k)]);
	disp(['   tf = ' num2str(tf)]);
end
