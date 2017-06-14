clc;
clear all;
close all;

x0 = [0; 0];
maximize = load('maximize.csv');
n = length(maximize);
signals = ones(1, n);
signals(maximize == 1) = -1;
b = load('coeficients.csv');
fname = @(x) f(x, b);
fx_struct = {};
for i = 1 : n
	fx_struct{i} = @(x) signals(i)*quad(x, b(:, i));
end;
payoff = calcPayoff(x0, fx_struct, fname, @h, size(b, 2));
weights = load('weights.csv');
utopy = getUtopy(payoff);
nadir = getNadir(payoff, maximize);
F = @(x, w) w * ((f(x, b) - utopy)./(nadir - utopy)).^2;
n = size(weights, 1);
for i = 1 : n
	w = weights(i, :);
	x = sqp(x0, @(x) feval(F, x, w), [], @h);
	frontier(:, i) = f(x, b);
end;

figure(1);
scatter3(frontier(1, :), frontier(2, :), frontier(3, :), 'filled');
title('Pareto Frontier');
xlabel('f_1(x)');
ylabel('f_2(x)');
zlabel('f_3(x)');
grid on;