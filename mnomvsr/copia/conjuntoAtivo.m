function [solution fsolution e k tf] = conjuntoAtivo(fname, gname, hname, gfname, ggname, ghname, x0, epsilon, k_max)
    tic();
    x = x0;
    gfx = feval(gfname, x);
    ggx = hgx = [];
    gx = feval(gname, x);
    if ~isempty(gx)
        ggx = feval(ggname, x);
    end;
    hx = feval(hname, x);
    if ~isempty(hx)
        ghx = feval(ghname, x);
        act = find(hx >= 0);
        hx = hx(act);
        ghx = ghx(:, act);
    end;

    act = find(hx >= 0);
    nact = find(hx < 0);

    %Matriz B0 - método quase newton
    alfa = 1;
    B0 = eye(length(x0));
    s = x;
    it = 0;
    for it = 0:k_max
        it = it + 1;
        Q = B0; %Definir as entradas
        c = gfx;
        A = [ggx';ghx(:,act)'];
        b = [-gx;-hx(act)];%a: referente ao h ativo tem que ser sempre omesmo numero de linahs da matriz A
        [Y,Z] = montaYZ(A); %Monta a matriz Y e Z
        [s,lambdaS] = calcula_atualizacao(A,b,c,Q,Y,Z,s); %Atualiza s e lambdaS
        if max(abs(s)) < epsilon
            p_mi = length(gx)+1:length(gx)+length(act);
            ak = find(lambdaS(p_mi) < 0);
            if isempty(ak)
                break;
            else
                nact = sort(nact, act(ak));
                act(ak) = [];
            end
        else
            x = x + alfa*s;
            fx = feval(fname, x);
            gx = feval(gname, x);
            hx = feval(hname, x);
            grad_L0 = [gfx - ggx*lambdaS(1,1) + ghx(:,1)*lambdaS(2,1) + ghx(:,2)*lambdaS(2,1)];
            gfx = feval(gfname, x);
            ggx = feval(ggname, x);
            ghx = feval(ghname, x);

            grad_L = [gfx - ggx*lambdaS(1,1) + ghx(:,1)*lambdaS(2,1) + ghx(:,2)*lambdaS(2,1)];

            %Atualizando B0 do quase Newton BFGS
            al = abs((gfx'*gfx)/(gfx'*B0*gfx));
            alfa = min([1;al]);
            y = grad_L - grad_L0;
            s0 = alfa*s;
            B0 = B0 - (B0*s0*s0'*B0)/(s0'*B0*s0) + (y*y')/(y'*s0); %Verificar se é B0 da lagrangeana
            ck = find(h(nact)>=0);
            act = [act nact(ck)];
            nact(ck) = [];
        end
    end
    tf = toc();
    solution = x
    fsolution = feval(fname, solution);
    e = norm(s);
    k = it;
end