function [Y,Z] = montaYZ(A)
%Utilizamos essa função para encontrar as matrizes Y e Z do método de
%programação quadrática ou programação sequencial quadrática. 
%A entrada é a matriz A dos coeficientes das restrições.

[nl nc] = size(A); %Capta a dimensão de A
rank_ok = 0;
tentativa = 0; %parâmetros do loop
while (rank_ok == 0) && (tentativa <= nc)
    B = A(:, tentativa+1:tentativa+nl); %montar matriz B
    N = A; %monta matriz N
    N(:, tentativa+1:tentativa+nl) = [];
    
    teste_rank = rank(B);
    if teste_rank == nl %teste se B é full rank (inversível)
        rank_ok = 1;
    end
    tentativa = tentativa + 1;
end

if tentativa > nc %Testa se houve matriz B inversível
    Y = [];
    Z = [];
    disp(['Erro: a matriz A não é "full rank"']);
else
    IB = inv(B);
    
    Y = [ IB ; zeros(size(N,2), size(B,2)) ]; %Monta a matriz Y
    
    if ~isempty(N) %Monta a matriz Z
        Z = [ -IB*N ; eye(size(N,2)) ];
    else
        Z = [];
    end
end