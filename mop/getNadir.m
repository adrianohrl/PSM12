function nadir = getNadir(payoff, maximize)

	n = size(payoff, 1);
	nadir = zeros(n, 1);
	for i = 1 : n
		if maximize(i)
			nadir(i) = min(payoff(i, :));
		else
			nadir(i) = max(payoff(i, :));
		end;
	end;

end