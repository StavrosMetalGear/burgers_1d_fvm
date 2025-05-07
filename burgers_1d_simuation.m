% burgers_1d_simulation.m
clc; clear; close all

n = 100;                      % Number of spatial points
x = linspace(0, 1, n);        % Uniform spatial grid
u0 = sin(2 * pi * x);         % Initial condition

% Solve using ode45 and the finite volume method
[t, u] = ode45(@ddt_finite_volumes, [0, 1], u0);

% Plot the final state
figure
plot(x, u(end, :), 'LineWidth', 2)
xlabel('x'), ylabel('u(x, t)')
title('1D Burgers'' Equation - Final State')
grid on
