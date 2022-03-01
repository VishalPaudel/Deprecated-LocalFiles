clc
clear
close all

%% Finding aproximations
% Take the equation Li'' + Ri' + i/C = 0

L = 1;
C = 1;

f_1 = @(t, i, v) (1 / L) * (i - ((i^3) / 3) + v);
f_2 = @(t, i, v) i + 0 * v;

t_0 = 0;
t_n = 200;
x_0 = 0;
y_0 = 1;
n = 500;

t = linspace(t_0, t_n, n);
[x, y] = runge_kutta(f_1, f_2, t_0, x_0, y_0, n, t_n);
% Graph of current in the system vs time
% Rate of change of Current vs Current

plot(x, y)
% Fun

%% Comparing to actual solution
% writing this in matrix form:
% A = 1;
% B = 2;
% 
% tspan = linspace(t_0, t_n, n);
% 
% y0 = [0 1];
% [t,y] = ode45(@(t,y) odefcn(t,y,L,C,R), tspan, y0);
% 
% plot(t,y(:, 1))
% 
% hold off
% m_A = [0 1; (-1 / (L * C)) ((-1 * R) / L)];

% eigenvalues and EIGENVECTORS, just from formula for now
