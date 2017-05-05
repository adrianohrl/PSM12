%% Método numérico de otimização de Máxima Declividade para uma função quadrática de múltiplas variáveis sem restrição
%
% Uso:
%
%		[solution fsolution e k tf] = maxDeclQuad(Q, c, x0, epsilon_f, epsilon_x, k_max)
%
% Exemplo:
%			
%		[x fx] = maxDeclQuad([1 0; 0 5], [0; 0], [-2; 2], 1e-4, 1e-5, 150);
%
function [solution fsolution e k tf alpha] = maxDeclQuad(Q, c, x0, epsilon_f, epsilon_x, k_max)
	tic();
	x(:, 1) = x0;
	gfx = Q * x0 - c;
	k = 1;
	while norm(gfx) > epsilon_f
		alpha(k) = (gfx' * gfx) / (gfx' * Q * gfx);
		x(:, k + 1) = x(:, k) - alpha(k) * gfx;
			k = k + 1;
		if norm(x(:, k) - x(:, k - 1)) <= epsilon_x
			break;
		end;
		if k == k_max 
			error('max number of iteration exceeded!!!');
		end;
		gfx = Q * x(:, k) - c;
	end;
	tf = toc();
	solution = x(:, k);
	fsolution = 0.5 * solution' * Q * solution - c' * solution;
	e = min([norm(gfx) norm(x(:, k) - x(:, k - 1))]);
	k = k - 1;
end
