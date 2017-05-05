%% Método numérico de otimização dos Gradientes Conjugados para uma função quadrática de múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = gcQuad(Q, c, x0, epsilon, k_max);
%
% Exemplo:
%				
%		[x fx] = gcQuad([1 0; 0 5], [0; 0], [-2; 2], 1e-4, 150);
%
function [solution fsolution e k tf alpha] = gcQuad(Q, c, x0, epsilon, k_max)
	tic();
	x = x0;
	r = Q * x - c;
	d = -r;
	k = 1;
	while norm(r) > epsilon
		alpha(k) = - (r' * d) / (d' * Q * d);
		x = x + alpha(k) * d;
		k = k + 1;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
		r = Q * x - c;
		beta = (d' * Q * r) / (d' * Q * d);
		d = -r + beta * d;
	end;
	tf = toc();
	solution = x;
	fsolution = 0.5 * solution' * Q * solution - c' * solution;
	e = norm(r);
	k = k - 1;
end
