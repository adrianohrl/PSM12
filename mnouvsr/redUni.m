%% Método numérico de otimização de Redução Unilateral para uma variável sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = redUni(fname, a, b, delta, epsilon, k_max);
%
% Exemplo, usar como método numérico de otimização:
%
%		[x fx] = redUni(@f, 0, 2, 1e-3, 1e-5, 150);
%
function [solution fsolution e k tf] = redUni(fname, a, b, delta, epsilon, k_max)
	tic();
	if a >= b
		error('a must be lesser than b!!!');
	end;
	if delta <= 0 || delta >= 1
		error('delta must be inside the (0, 1) interval!!!');
	end;
	x(1) = b;
	fx(1) = feval(fname, b);
	k = 1;
	while true
		x(k + 1) = delta * x(k);
		fx(k + 1) = feval(fname, x(k + 1));
		if fx(k + 1) >= fx(k)
			break;
		end;
		if x(k) - a < epsilon
			error('it has run throw all the interval but it did not found any optimal point!!!');
		end;
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
	end;
	tf = toc();
	solution = x(k);
	fsolution = fx(k);
	e = abs(fx(k + 1) - fx(k));
end
