%% Método numérico de otimização da Região de Confiança para uma função quadrática de múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = regConf(fname, gfname, x0, eta, delta0, delta_max, epsilon, k_max, method)
%
% Exemplo:
%		
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 5, 1e-4, 150, @pontoCauchy);
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 5, 1e-4, 150, @passoNewton);
%		addpath('../mnouvsr');		
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 2, 5, 1e-5, 150, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) redUni(fname, a, b, 1e-4, 1e-3, 100)));
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 2, 5, 1e-5, 150, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) redBi(fname, a, b, 1e-3, 100)));
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 2, 5, 1e-5, 150, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) fib(fname, a, b, 30, 1e-3, 100)));
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 2, 5, 1e-5, 150, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) gs(fname, a, b, 30, 1e-3, 100)));
%		[x fx] = regConf(@f, @gf, [-2; 2], 0.2, 2, 5, 1e-5, 150, @(gfx, hfx, delta) dogleg(gfx, hfx, delta, @(fname, a, b) interQuad(fname, a, b, 1e-3, 100)));
%		rmpath('../mnouvsr');
%
function [solution fsolution e k tf] = regConf(fname, gfname, x0, eta1, delta0, delta_max, epsilon, k_max, method)
	tic();
	if delta_max <= 0
		error('delta_max must be positive!!!');
	end;
	if delta0 <= 0
		error('delta0 must be positive!!!');
	elseif delta0 > delta_max
		error('delta0 must be lesser than delta_max!!!');
	end;
	t1 = 1 / 4;
	t2 = 2;
	eta2 = 1 / 4;
	eta3 = 3 / 4;
	if eta1 < 0 
		error('eta1 must not be negative!!!');
	end;
	if eta1 >= eta2
		error(['eta1 must be lesser than ' num2str(eta2) '!!!']);
	end;
	m0 = zeros(size(x0));
	delta = delta0;
	x(:, 1) = x0;
	gfx = feval(gfname, x0);
	hfx = eye(length(x0));
	k = 1;
	while norm(gfx) > epsilon
		fx = feval(fname, x);
		delta_x = feval(method, gfx, hfx, delta);
		rho = (fx - feval(fname, x + delta_x)) / (m(fx, gfx, hfx, m0) - m(fx, gfx, hfx, delta_x));
		if rho < eta2
			delta = t1 * delta;
		elseif rho > eta3 && norm(delta_x) == delta
			delta = min(t2 * delta, delta_max)
		end;
		if rho > eta1
			x = x + delta_x;
			gfx = feval(gfname, x);
			hfx = BFGS(gfname, x, x - delta_x, hfx);
		end;
		k = k + 1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	tf = toc();
	solution = x;
	fsolution = feval(fname, solution);
	e = norm(gfx);
	k = k - 1;
end
