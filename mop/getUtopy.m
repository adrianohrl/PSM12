function utopy = getUtopy(payoff)

	n = size(payoff, 1);
	utopy = zeros(n, 1);
	for i = 1 : n
		utopy(i) = payoff(i, i);
	end;

end