%% Método numérico de otimização dos Conjuntos Ativos de múltiplas variáveis com restrição
%
% Uso:
%
%		[solution fsolution e k tf] = conjAtiv(gname, hname, ggname, ghname, x) 
%
% Exemplo:
%		
%		[x fx] = conjAtiv(...);
%
function [delta_x alpha] = updateDeltaXAlpha(gname, hname, ggname, ghname, x) 
	delta_xy = -inv(A * Y) * (A * x - b);
	delta_xz = -inv(Z' * Q * Z) * Z' * (Q * (Y * delta_xy + x) + c);
	delta_x = Y * delta_xy + Z * delta_xz;
	x = x + delta_x;
	lambda = - inv((A * Y)') * Y' * (Q * x + c);
end
