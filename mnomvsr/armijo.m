function alpha = armijo(fname, gfname, x0, d, c1, delta_alpha)
	if c1 <= 0 || c1 >= 1
		error('c1 must be inside the (0, 1) interval!!!');
	end;
	if delta_alpha <= 0 || delta_alpha >= 1
		error('delta_alpha must be inside the (0, 1) interval!!!');
	end;
    % Condição de Armijo: [lhs] f(x + alpha * d) =< f(x) + c1 * alpha * gf(x)' * d) [rhs]
    x = x0;
    alpha = 1; % Valor inicial de alpha
    lhs = @(alpha) feval(fname, x0 + alpha * d); %2; % Valor inicial do lado esquerdo da Condição de Armijo
    rhs = @(alpha) feval(fname, x0) + c1 * alpha * feval(gfname, x0)' * d; %1; % Valor inicial do lado direito da Condição de Armijo
    while lhs(alpha) > rhs(alpha)
    	alpha = alpha * (1 - delta_alpha); 
    end
end;