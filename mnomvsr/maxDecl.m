%% Método numérico de otimização de Máxima Declividade para múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = maxDecl(fname, gfname, x0, epsilon_f, epsilon_x, k_max, fminname);
%
% Exemplo:
%		
%		addpath('../mnouvsr');		
%		[x fx] = maxDecl(@f, @gf, [-2; 2], 1e-4, 1e-5, 150, @(fname, a, b) redUni(fname, a, b, 1e-4, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2; 2], 1e-4, 1e-5, 150, @(fname, a, b) redBi(fname, a, b, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2; 2], 1e-4, 1e-5, 150, @(fname, a, b) fib(fname, a, b, 30, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2; 2], 1e-4, 1e-5, 150, @(fname, a, b) gs(fname, a, b, 30, 1e-3, 100));
%		[x fx] = maxDecl(@f, @gf, [-2; 2], 1e-4, 1e-5, 150, @(fname, a, b) interQuad(fname, a, b, 1e-3, 100));
%		rmpath('../mnouvsr');
%
function [solution fsolution e k tf alpha] = maxDecl(fname, gfname, x0, c1, delta_alpha, epsilon_f, epsilon_x, k_max)%, fminname)
	tic();
	x(:, 1) = x0;
	gfx = feval(gfname, x0);
	k = 1;
	while norm(gfx) > epsilon_f
		d = -gfx;
		% alpha(k) = feval(fminname, @(alpha) f_alpha(fname, x(:, k), alpha, d), 0, 1);
		alpha(k) = armijo(fname, gfname, x(:, k), d, c1, delta_alpha);
		x(:, k + 1) = x(:, k) + alpha(k) * d;
		k = k + 1;
		if norm(x(:, k) - x(:, k - 1)) <= epsilon_x
			break;
		end; 
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		gfx = feval(gfname, x(:, k));
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
