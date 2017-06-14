function [Y,Z] = montaYZ(A)
%Utilizamos essa fun��o para encontrar as matrizes Y e Z do m�todo de
%programa��o quadr�tica ou programa��o sequencial quadr�tica. 
%A entrada � a matriz A dos coeficientes das restri��es.

[nl nc] = size(A); %Capta a dimens�o de A
rank_ok = 0;
tentativa = 0; %par�metros do loop
while (rank_ok == 0) && (tentativa <= nc)
    B = A(:, tentativa+1:tentativa+nl); %montar matriz B
    N = A; %monta matriz N
    N(:, tentativa+1:tentativa+nl) = [];
    
    teste_rank = rank(B);
    if teste_rank == nl %teste se B � full rank (invers�vel)
        rank_ok = 1;
    end
    tentativa = tentativa + 1;
end

if tentativa > nc %Testa se houve matriz B invers�vel
    Y = [];
    Z = [];
    disp(['Erro: a matriz A n�o � "full rank"']);
else
    IB = inv(B);
    
    Y = [ IB ; zeros(size(N,2), size(B,2)) ]; %Monta a matriz Y
    
    if ~isempty(N) %Monta a matriz Z
        Z = [ -IB*N ; eye(size(N,2)) ];
    else
        Z = [];
    end
end