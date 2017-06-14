close all; clear all; clc;
media=[1.05 1.08 1.10];
vari=[0.01 0.02 0.03];

%Gerando 1000 portfolios aleatórios
W=[];
Risco=[];
Retorno=[];
for k=1:1:1000
    w = rand(1,3);
    w = [w(1)/sum(w);w(2)/sum(w);w(3)/sum(w)]; %soma=1
    W = [W w];
    Risco = [Risco vari*(w.^2)];
    Retorno=[Retorno media*w];
end

%minima variancia
minVar=find(Risco==min(Risco));
display 'mínima variância:';
minRetorno=Retorno(minVar)
minVariancia=Risco(minVar)
display 'pesos w para mínima variância:'; pMin=W(:,minVar)

%maximo retorno
maxRet=find(Retorno==max(Retorno));
display 'máximo retorno:'; 
maxRetorno=Retorno(maxRet)
maxVariancia=Risco(maxRet)
display 'pesos w para máximo retorno:'; pMax=W(:,maxRet)

%mais vantajoso = DEA
RR=1000;
teta=[];
f = [1 zeros(1,RR)]';
Atotal = [Risco; -1*Retorno]; 
btotal = [-1*Retorno]';
lb = zeros(RR+1,1);
for k=1:1:RR
  A = [-1*Atotal(1,k) Atotal(1,:); 0 Atotal(2,:)];
   b = [0; btotal(k)];
  [x,fval]=linprog(f,A,b,[],[],lb);
  teta=[teta fval];
end
eff=find(teta==max(teta));
eff=eff(1);
display 'mais produtivo:'; 
prodRetorno=Retorno(eff)
prodVariancia=Risco(eff)
display 'pesos w para mais produtivo:'; pProd=W(:,eff)

plot(Risco,Retorno, '.');
axis ([-0.000001 0.030001 0.090001 0.21001]);
xlabel('Risco');
ylabel('Retorno');
hold on;
plot(Risco(1,eff),Retorno(1,eff),'r*','markersize',10);