%Resolucao do exercicio do slide 27 com o metodo de newton
clear
clc
tic
x = [2;2];
gf =[-4*x(2)*x(1)+4*x(1)^3-2+2*x(1); 2*x(2)-2*x(1)^2];
rk = gf;
dk = -rk;
k = 0;
while(max(abs(rk))) > 1e-6
    
    h=[-4*x(2)+12*x(1)^2+2 -4*x(1);-4*x(1) 2];
    alfak = -(rk'*dk) / (dk'*h*dk);
    x = x + alfak*dk;
    
    gf =[-4*x(2)*x(1)+4*x(1)^3-2+2*x(1); 2*x(2)-2*x(1)^2];
    rk1 = rk;
    rk = gf;
    
    if(max(abs(rk))) < 1e-6
        break
    end
    
    beta = (rk'*rk) / (rk1'*rk1);
    dk = -rk + beta*dk;
    k = k+1;
    
end
    toc