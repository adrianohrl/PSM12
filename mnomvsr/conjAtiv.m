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
function [A b] = conjAtiv(gname, hname, ggname, ghname, x) 
	gx = hx = ggx = hgx = [];
	gx = feval(gname, x);	
	if ~isempty(gx)
		ggx = feval(ggname, x);
	end;
	hx = feval(hname, x);
	if ~isempty(hx)
		ghx = feval(ghname, x);
		active = find(hx >= 0);
		hx = hx(active);
		ghx = ghx(:, active);
	end;
	A = [ggx'; ghx'];
	b = [-gx; -hx];
end
