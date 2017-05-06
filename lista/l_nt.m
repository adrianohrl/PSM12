function y = l_nt(theta, a, b, x)
	mu = theta(1);
	sigma2 = theta(2);
	n = length(x);
	y = -0.5*n*log(2*pi) - 0.5*n*log(sigma2) ...
		-0.5/sigma2*(x - mu*ones(n, 1))'*(x - mu*ones(n, 1)) ...
		-log(normcdf(b, mu, sqrt(sigma2)) - normcdf(a, mu, sqrt(sigma2)));
end