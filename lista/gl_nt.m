function y = gl_nt(theta, a, b, x)
	epsilon = 1e-3;
	mu = theta(1);
	sigma = theta(2);
	n = length(x);
	dg_dmu = @(x) normpdf(x, mu, sigma).*(x - mu) / sigma;
	dg_dsigma2 = @(x) 1/2*sigma^2*(((x - mu)/sigma).^2 - 1).*normpdf(x, mu, sigma);
	dl_dmu = 1/sigma^2*(sum(x) - n*mu) ...
			-quadgk(dg_dmu, a, b, epsilon)/(normcdf(b, mu, sigma^2) - normcdf(a, mu, sigma^2));
	dl_dsigma2 = -0.5*n/sigma^2 + 0.5/sigma^4*(x - mu*ones(n, 1))'*(x - mu*ones(n, 1)) ...
			-quadgk(dg_dsigma2, a, b, epsilon)/(normcdf(b, mu, sigma^2) - normcdf(a, mu, sigma^2));
	y = [dl_dmu; dl_dsigma2];
end