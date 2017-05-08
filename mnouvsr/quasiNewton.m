%% Método numérico de otimização de Quasi-Newton para uma variável sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = quasiNewton(fname, delta_x, x0, epsilon, k_max);
%
% Exemplo, usar como método numérico de otimização:
%
%		[x fx] = quasiNewton(@f, 1e-4, 2, 1e-5, 150);
%
function [solution fsolution e k tf] = quasiNewton(fname, delta_x, x0, epsilon, k_max)
	tic();
	x = x0;
	k = 1;
	while true
		_fx = feval(fname, x - delta_x);
		fx = feval(fname, x);
		fx_ = feval(fname, x + delta_x);
		dfx = (fx_ - _fx) / (2 * delta_x);
		if abs(dfx) <= epsilon
			break;
		end;
		x = x - delta_x ^ 2 * dfx / (_fx - 2 * fx + fx_);
		k = k + 1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	tf = toc();
	solution = x;
	fsolution = fx;
	e = abs(fx);
end
