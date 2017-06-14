function payoff = calcPayoff(x0, fx_struct, fname, hname, n)

	payoff = zeros(n);
	for i = 1 : n
		x = sqp(x0, fx_struct{i}, [], hname);
		payoff(:, i) = feval(fname, x);
	end;

end