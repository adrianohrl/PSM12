%% Método numérico de otimização de Máxima Declividade para múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = maxDecl(fname, gfname, x0, epsilon_f, epsilon_x, k_max, fminname);
%
% Exemplo:
%		
%		addpath('../mnouvsr');		
%		[x fx] = maxDecl(@f, @gf, [-2 2], 1e-4, 1e-5, 150, @(fname, a, b) redUni(fname, a, b, 1e-4, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2 2], 1e-4, 1e-5, 150, @(fname, a, b) redBi(fname, a, b, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2 2], 1e-4, 1e-5, 150, @(fname, a, b) fib(fname, a, b, 30, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2 2], 1e-4, 1e-5, 150, @(fname, a, b) gs(fname, a, b, 30, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2 2], 1e-4, 1e-5, 150, @(fname, a, b) interQuad(fname, a, b, 1e-3, 100));
%		rmpath('../mnouvsr');
%
function [solution fsolution e k tf] = maxDecl(fname, gfname, x0, epsilon_f, epsilon_x, k_max, fminname)
	tic();
	x(:, 1) = x0;
	gfx = feval(gfname, x0);
	k = 1;
	while norm(gfx) > epsilon_f
		alpha = feval(fminname, @(alpha) f_alpha(fname, x(:, k), alpha, -gfx), 0, 1);
		x(:, k + 1) = x(:, k) - alpha * gfx;
		if norm(x(:, k + 1) - x(:, k)) <= epsilon_x
			break;
		end;
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
		gfx = feval(gfname, x(:, k));
	end;
	tf = toc();
	solution = x(:, k);
	fsolution = feval(fname, solution);
	e = max([norm(gfx) norm(x(:, k + 1) - x(:, k))]);
end
