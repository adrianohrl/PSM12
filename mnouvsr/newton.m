function solution = newton(fname, dfname, x0, epsilon, k_max)
	tic();
	x(1) = x0;
	fx(1) = feval(fname, x0);
	k = 1;
	while abs(fx(k)) > epsilon
		dfx(k) = feval(dfname, x(k));
		x(k + 1) = x(k) - fx(k) / dfx(k);
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
		fx(k) = feval(fname, x(k));
	end;
	solution = x(k);
	tf = toc();
	disp(['   x* = ' num2str(solution)]);
	disp(['   e  = ' num2str(abs(fx(k)))]);
	disp(['   k  = ' num2str(k)]);
	disp(['   tf = ' num2str(tf)]);
	if dfx < 0
		str = [func2str(dfname) '(x*) < 0'];
	elseif dfx == 0
		str = [func2str(dfname) '(x*) = 0'];
	else
		str = [func2str(dfname) '(x*) > 0'];
	end;
	disp(['   ' func2str(fname) '(x*) = 0 && ' str]);
end
