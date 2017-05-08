%% Método numérico Newton-Raphson para encontrar raízes de uma função com múltiplas variáveis
%
% Uso:
%
%		[solution fsolution e k tf] = newton(fname, gfname, x0, epsilon_f, epsilon_x, k_max);
%
% Exemplo, usar como método numérico de otimização:
%		
%		[x fx] = newton(@gf, @hf, [-2; 2], 1e-4, 1e-5, 150);
%
function [solution fsolution e k tf] = newton(fname, gfname, x0, epsilon_f, epsilon_x, k_max)
	tic();
	x(:, 1) = x0;
	fx = feval(fname, x0);
	k = 1;
	while norm(fx) > epsilon_f
		gfx = feval(gfname, x(:, k));
		x(:, k + 1) = x(:, k) - gfx \ fx;
		k = k + 1;
		if norm(x(:, k) - x(:, k - 1)) <= epsilon_x
			break;
		end;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		fx = feval(fname, x(:, k));
	end;
	tf = toc();
	solution = x(:, k);
	fsolution = feval(fname, solution);
	e = norm(fx);
	if k > 1 
		e = min([e norm(x(:, k) - x(:, k - 1))]);
	end;
	k = k - 1;
end
