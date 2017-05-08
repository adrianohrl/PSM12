function D = invBFGS(gfname, x, x0, D0)
	s = x - x0;
	y = feval(gfname, x) - feval(gfname, x0);
	D = D0 + (s * s') / (y' * s) - (D0 * y * y' * D0') / (y' * D0 * y);
end;