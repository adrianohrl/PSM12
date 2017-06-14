function [ceq] = mycon(x)
%Funções de restrições.

%c = [x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(5)^2 - 10;
%    x(1)^3 + x(2)^3 - 1]; %restrições não lineares de desigualdade

ceq = x(2)*x(3)-5*x(4)*x(5); %restrições não lineares de igualdade.