%% Método numérico Newton-Raphson para encontrar raízes de uma função com uma variável
%
% Uso:
%
%		[solution fsolution e k tf msg] = newton(fname, dfname, x0, epsilon, k_max);
%
% Exemplo, usar como método numérico de otimização:
%
%		[x fx] = newton(@df, @d2f, 2, 1e-5, 150);
%
function [solution fsolution e k tf msg] = newton(fname, dfname, x0, epsilon, k_max)
	tic();
	x(1) = x0;
	fx = feval(fname, x0);
	k = 1;
	while abs(fx) > epsilon
		dfx = feval(dfname, x);
		x = x - fx / dfx;
		k = k + 1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		fx = feval(fname, x);
	end;
	tf = toc();	
	solution = x;
	fsolution = fx;
	e = abs(fx);
	if dfx < 0
		msg = [func2str(dfname) '(x*) < 0'];
	elseif dfx == 0
		msg = [func2str(dfname) '(x*) = 0'];
	else
		msg = [func2str(dfname) '(x*) > 0'];
	end;
	msg = [func2str(fname) '(x*) = 0 && ' msg];
end
