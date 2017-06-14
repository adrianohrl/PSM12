%% Método numérico de otimização de Programação Quadrática de múltiplas variáveis com restrição
%
% Uso:
%
%		[solution fsolution e k tf] = pq(Q, c, A, b, B, N, x); 
%
% Exemplo:
%		
%		[x fx] = pq(...);
%
function [solution fsolution e k tf] = pq(fname, gname, hname, gfname, ggname, gghname, x0, epsilon, k_max)
	error('nao esta funcionando');
	tic();
	x(:, 1) = x0;
	c = feval(gfname, x0);
	Q = eye(length(x0));
	k = 1;
	while % norm(r) > epsilon
		[A b] = conjAtiv(gname, hname, ggname, ghname, x);
		[Y Z] = calculateYZ(A);
		delta_xy = -(A * Y) \ (A * x - b);
		delta_x = Y * delta_xy;
		if ~isempty(Z)
			delta_xz = -(Z' * Q * Z)\ (Z' * (Q * (Y * delta_xy + x(:, k)) + c));
			delta_x = delta_x + Z * delta_xz;
		end;
		x(:, k + 1) = x(:, k) + delta_x;
		lambda = - ((A * Y)') \ (Y' * (Q * x(:, k) + c));
		if norm(x(:, k)) < epsilon
			p_mi = length(gx) + 1 : length(gx) + length(act);
         	ak = find(lambda(p_mi) < 0);
         	if isempty(ak)
         		break;
         	end;
        else
        	
		end;
		k = k +1;
		if k > k_max 
			error('max number of iteration exceeded!!!');
		end;
		Q = BFGS(gfname, x(:, k), x(:, k - 1), Q);
		c = feval(gfname, x(:, k));
	end;
	tf = toc();
	solution = x;
	fsolution = feval(fname, solution);
	e = norm(r);
	k = k - 1;
end
