%% Método numérico de otimização de Programação Quadrática de múltiplas variáveis com restrição
%
% Uso:
%
%		[solution fsolution e k tf] = progQuad(Q, c, A, b, B, N, x); 
%
% Exemplo:
%		
%		[x fx] = progQuad(...);
%
function [solution fsolution e k tf] = progQuad(fname, gname, gfname, ggname, x0, lambda0, epsilon, k_max) 
	tic();
	x = x0;
	lambda = lambda0;
	gx = feval(gname, x0);
	gfx = feval(gfname, x0);
	ggx = feval(ggname, x0);
	k = 1;
	while norm(F) > epsilon
		% minimizar aki para encontrar delta_x
		x = x + delta_x;
		% atualizar lambda
		k = k + 1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		gx = feval(gname, x);
		gfx = feval(gfname, x);
		ggx = feval(ggname, x);
		F = [-gfx + ggx' * lambda; -gx];
	end;
	tf = toc();
	solution = x;
	fsolution = feval(fname, solution);
	e = norm(gfx);
	k = k - 1;
end
