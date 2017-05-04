function y = f_alpha(fname, x, alpha, d)
	y = feval(fname, x + alpha * d);
end