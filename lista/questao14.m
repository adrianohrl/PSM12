clc;
clear all;
close all;
warning off;

Q = [1 0; 0 1];
c = [4; 10];
A = [1 -2; -1 -1; -1 0; 0 1; 1 0];
b = [-2; -6; -5; 0; 1];

p = [1 1 2 5 5; 0 3 4 1 0]; % pontos de intersecção das restrições
[p(1, :) i] = sort(p(1, :));
p(2, :) = p(2, i);
figure;
fill(p(1,:)',p(2,:), 'r');
hold on;
grid on;

x1c = 2;
x2c = 5;
ra = sqrt(29);
rb = sqrt(29);
t = 0 : .01 : 2 * pi;
x1 = ra * cos(t) + x1c;
x2 = rb * sin(t) + x2c;
plot(x1, x2);

