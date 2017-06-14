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
function [solution fsolution e k tf] = progQuad(Q, c, A, b, B, N, x) 
	tic();
	[m n] = size(A);
	if m > n
		error('m must be lesser than or equals to n!!!');
	end;
	invB = inv(B);
	Y = [invB; zeros(n - m, m)];
	Z = [-invB*N; eye(n - m, n - m)];
	delta_xy = -inv(A * Y) * (A * x - b);
	delta_xz = -inv(Z' * Q * Z) * Z' * (Q * (Y * delta_xy + x) + c);
	delta_x = Y * delta_xy + Z * delta_xz;
	x = x + delta_x;
	lambda = - inv((A * Y)') * Y' * (Q * x + c);
	tf = toc();
	solution = x;
	fsolution = feval(fname, solution);
	e = norm(gfx);
	k = k - 1;
end
