function [Y Z] = calculateYZ(A)
	[m n] = size(A);
    rank_ok = 0;
    tentativa = 0;
    for i = 1 : n - 1
        B = A(:, i + 1 : i + m);
        N = A;
        N(:, i + 1 : i + n) = [];
        if rank(B) == m
            break;
        end;
    end;
    if i + 1 > n
        error('The A matrix is not full rank!!!');
    end;
    invB = inv(B);
    Y = [invB; zeros(size(N, 2), size(B, 2))];
    Z = [];
    if ~isempty(N)
        Z = [-invB*N; eye(size(N, 2))];
    end;
end