function [ceq] = mycon(x)
%Fun��es de restri��es.

%c = [x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(5)^2 - 10;
%    x(1)^3 + x(2)^3 - 1]; %restri��es n�o lineares de desigualdade

ceq = x(2)*x(3)-5*x(4)*x(5); %restri��es n�o lineares de igualdade.