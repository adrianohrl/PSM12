function B = BFGS(gfname, x, x0, B0)
	s = x - x0;
	y = feval(gfname, x) - feval(gfname, x0);
	B = B0 + (y * y') / (y' * s) - (B0 * s * s' * B0') / (s' * B0 * s);
end;