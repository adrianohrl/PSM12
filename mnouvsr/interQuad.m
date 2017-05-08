%% Método numérico de otimização de Interpolação Quadrática para uma variável sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = interQuad(fname, a, b, epsilon, k_max)
%
% Exemplo:
%
%		[x fx] = interQuad(@f, 0, 2, 1e-5, 150);
%
function [solution fsolution e k tf] = interQuad(fname, a, b, epsilon, k_max)
	tic();
	if a >= b
		error('a must be lesser than b!!!');
	end;
	t = (b - a) / 4;
	x0 = a + t;
	x1 = a + 2 * t;
	x2 = a + 3 * t;
	k = 1;
	while true
		fx0 = feval(fname, x0);
		fx1 = feval(fname, x1);
		fx2 = feval(fname, x2);
		A = [1 x0 x0^2; 1 x1 x1^2; 1 x2 x2^2];
		b = [fx0; fx1; fx2];
		coeficients = A \ b;
		xs = -coeficients(2) / (2 * coeficients(3));
		fxs = feval(fname, xs);
		hxs = h(xs, coeficients);
		if abs(fxs - hxs) <= epsilon
			break;
		end;
		if xs > x1
			if fxs < fx1
				x0 = x1;
				x1 = xs;
			elseif fxs > fx1
				x2 = xs;
			end; 
		else
			if fxs < fx1
				x2 = x1;
				x1 = xs;
			elseif fxs > fx1
				x0 = xs;
			end; 
		end;
		k = k + 1;
		if k > k_max
			error('max number of iterations exceeded!!!');
		end;
	end;
	tf = toc();
	solution = xs;
	fsolution = fxs;
	e = abs(fxs - hxs);
end
