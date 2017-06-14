function [s,lambda] = calcula_atualizacao(A,b,c,Q,Y,Z,s0)
%Essa fun��o � utilizada para atualizarmos os termos s e lambda do m�todo
%de programa��o quadr�tica.
%OBS: Vetor x e c devem ser coluna

DeltaSy = -inv(A*Y)*(A*s0-b);
if ~isempty(Z)
    DeltaSz = (Z'*Q*Z)\(-Z'*Q*Y*DeltaSy - Z'*(c+Q*s0));
    DeltaS = Y*DeltaSy + Z*DeltaSz;
else
    DeltaS = Y*DeltaSy;
end
s = s0 + DeltaS;
lambda = -((A*Y)')\(Y'*(c+Q*s));

