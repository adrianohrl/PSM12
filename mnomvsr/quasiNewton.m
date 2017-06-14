%% Método numérico de otimização Quasi Newton para múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = quasiNewton(fname, gfname, x0, alpha, epsilon_f, epsilon_x, k_max);
%
% Exemplo:
%				
%		[x fx] = quasiNewton(@f, @gf, [-2; 2], 0.75, 1e-4, 1e-5, 150);
%
function [solution fsolution e k tf] = quasiNewton(fname, gfname, x0, c1, delta_alpha, epsilon_f, epsilon_x, k_max)
	tic();
	x(:, 1) = x0;
	gfx = feval(gfname, x0);
	D = eye(length(x0));
	k = 1;
	while norm(gfx) > epsilon_f
		d = - D * gfx;
		alpha = armijo(fname, gfname, x(:, k), d, c1, delta_alpha);
		x(:, k + 1) = x(:, k) + alpha * d;
		k = k + 1;
		if norm(x(:, k) - x(:, k - 1)) <= epsilon_x
			break;
		end;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		gfx = feval(gfname, x(:, k));
		D = invBFGS(gfname, x(:, k), x(:, k - 1), D);
	end;
	tf = toc();
	solution = x(:, k);
	fsolution = feval(fname, solution);
	e = norm(gfx);
	if k > 1 
		e = min([e norm(x(:, k) - x(:, k - 1))]);
	end;
	k = k - 1;
end
