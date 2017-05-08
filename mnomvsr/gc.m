%% Método numérico de otimização dos Gradientes Conjugados para múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = gc(fname, gfname, x0, alpha, epsilon, k_max, fminname);
%
% Exemplo:
%				
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150);
%		addpath('../mnouvsr');		
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150, @(fname, a, b) redUni(fname, a, b, 1e-4, 1e-3, 100));
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150, @(fname, a, b) redBi(fname, a, b, 1e-3, 100));
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150, @(fname, a, b) fib(fname, a, b, 30, 1e-3, 100));
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150, @(fname, a, b) gs(fname, a, b, 30, 1e-3, 100));
%		[x fx] = gc(@f, @gf, [-2; 2], 1e-4, 150, @(fname, a, b) interQuad(fname, a, b, 1e-3, 100));
%		rmpath('../mnouvsr');
%
function [solution fsolution e k tf alpha] = gc(fname, gfname, x0, epsilon, k_max, fminname)
	tic();
	x = x0;
	r = feval(gfname, x);
	d = -r;
	k = 1;
	while norm(r) > epsilon
		alpha(k) = feval(fminname, @(alpha) f_alpha(fname, x, alpha, d), 0, 1);
		x = x + alpha(k) * d;
		k = k + 1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		fdx = feval(gfname, x);
		beta = (fdx' * fdx) / (r' * r);
		r = fdx;
		d = -r + beta * d;
	end;
	tf = toc();
	solution = x;
	fsolution = feval(fname, solution);
	e = norm(r);
	k = k - 1;
end
