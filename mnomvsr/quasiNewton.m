%% Método numérico de otimização de Máxima Declividade para múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = quasiNewton(fname, gfname, x0, alpha, epsilon_f, epsilon_x, k_max);
%
% Exemplo:
%				
%		[x fx] = quasiNewton(@f, @gf, [-2; 2], 0.75, 1e-4, 1e-5, 150, @(fname, a, b) redUni(fname, a, b, 1e-4, 1e-3, 100));
%
function [solution fsolution e k tf] = quasiNewton(fname, gfname, x0, alpha, epsilon_f, epsilon_x, k_max)
	tic();
	if alpha <= 0 || alpha > 1
		error('alpha must be inside the (0, 1] interval!!!');
	end;
	x(:, 1) = x0;
	D = eye(length(x0));
	gfx = feval(gfname, x0);
	k = 1;
	while norm(gfx) > epsilon_f
		x(:, k + 1) = x(:, k) - alpha * D * gfx;
		k = k + 1;
		if norm(x(:, k) - x(:, k - 1)) <= epsilon_x
			break;
		end;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
		D = bfgs(gfname, x(:, k), x(:, k - 1), D);
		gfx = feval(gfname, x(:, k));
	end;
	tf = toc();
	solution = x(:, k);
	fsolution = feval(fname, solution);
	e = min([norm(gfx) norm(x(:, k) - x(:, k - 1))]);
	k = k - 1;
end
