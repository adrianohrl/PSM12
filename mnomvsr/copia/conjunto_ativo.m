%Implementação do Conjunto Ativo com Método de Programação Quadrática
%13/04/2011
clear all
clc

%Passo 0   
x = [1 ; 0 ; 2.78 ; 0.003 ; 0.003];
alfa=1;
E = 10^(-7);

fun = @(x)myfun(x); %Função objetivo

ineq = @(x)myconc(x); %Funções de restrições. c - funções desigualdade 
eq = @(x)myconceq(x); %Funções de restrições. ceq - função de igualdade
gun = eq; 
hun=ineq;

fx = feval(fun, x);
gx = feval(gun, x);
h = feval(hun, x);

act=find(h>=0);%mostrar a posição para qual será a restrição ativa
nact=find(h<0);%mostrar a posição para qual será a restrição não ativa


%Gradiente de f
[Gf] = [x(5)*x(4)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))-3*x(1)^2*(x(2)^3+x(1)^3+1)
x(5)*x(4)*x(1)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))-3*x(2)^2*(x(2)^3+x(1)^3+1)
x(5)*x(4)*x(1)*x(2)*exp(x(1)*x(2)*x(3)*x(4)*x(5))
x(5)*x(1)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))
x(4)*x(1)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))];

%Gradiente de g
[Gg] = [0
    x(3)
    x(2)
    -5*x(5)
    -5*x(4)];


%Gradiente de h
[Gh] = [2*x(1)   3*x(1)^2
        2*x(2)   3*x(2)^2
        2*x(3)   0
        2*x(4)   0
        2*x(5)   0];

%Matriz B0 - método quase newton
B0 = eye(5);
s = x;
it=0;
for it = 0:100
    it = it + 1;
        
    Q = B0; %Definir as entradas
    c = Gf;
    A = [Gg';Gh(:,act)'];
    b = [-gx;-h(act)];%a: referente ao h ativo tem que ser sempre omesmo numero de linahs da matriz A
    
    [Y,Z] = montaYZ(A); %Monta a matriz Y e Z
    
    [s,lambdaS] = calcula_atualizacao(A,b,c,Q,Y,Z,s); %Atualiza s e lambdaS
    
     if max(abs(s)) < E
         p_mi = length(gx)+1:length(gx)+length(act);
         ak = find(lambdaS(p_mi) < 0);
         if isempty(ak)
             disp('SOLUÇÃO OBTIDA')
             it
             x
             
             return 
         else
             nact = sort(nact, act(ak));
             act(ak) = [];
         end
     else
         x = x + alfa*s;
         fx = feval(fun, x);
         gx = feval(gun, x);
         h = feval(hun, x);
         
         grad_L0 = [Gf - Gg*lambdaS(1,1) + Gh(:,1)*lambdaS(2,1) + Gh(:,2)*lambdaS(2,1)];
         
         %Gradiente de f
         [Gf] = [x(5)*x(4)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))-3*x(1)^2*(x(2)^3+x(1)^3+1)
             x(5)*x(4)*x(1)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))-3*x(2)^2*(x(2)^3+x(1)^3+1)
             x(5)*x(4)*x(1)*x(2)*exp(x(1)*x(2)*x(3)*x(4)*x(5))
             x(5)*x(1)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))
             x(4)*x(1)*x(2)*x(3)*exp(x(1)*x(2)*x(3)*x(4)*x(5))];
                 
         %Gradiente de g
         [Gg] = [0
             x(3)
             x(2)
             -5*x(5)
             -5*x(4)];
         
         %Gradiente de h
         [Gh] = [2*x(1)   3*x(1)^2
                 2*x(2)   3*x(2)^2
                 2*x(3)   0
                 2*x(4)   0
                 2*x(5)   0];
         
         grad_L = [Gf - Gg*lambdaS(1,1) + Gh(:,1)*lambdaS(2,1) + Gh(:,2)*lambdaS(2,1)];
         
         %Atualizando B0 do quase Newton BFGS
         al = abs((Gf'*Gf)/(Gf'*B0*Gf));
         alfa = min([1;al]);
         y = grad_L - grad_L0;
         s0 = alfa*s;
         B0 = B0 - (B0*s0*s0'*B0)/(s0'*B0*s0) + (y*y')/(y'*s0); %Verificar se é B0 da lagrangeana
         ck = find(h(nact)>=0);
         act = [act nact(ck)];
         nact(ck) = [];
     end
end
it
x


