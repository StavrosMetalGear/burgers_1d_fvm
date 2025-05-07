function dudt = ddt_finite_volumes(~, u)
n = length(u);
dx = 1 / n;

f = u.^2 / 2;  % Nonlinear flux
speed_sign = (f(2:end) - f(1:end-1)) .* (u(2:end) - u(1:end-1));

f_right = f(2:end);
f_interface = zeros(size(f_right));
f_interface(speed_sign < 0) = f_right(speed_sign < 0);

% Pad the interfaces
f_interface = [0; f_interface; f(end)];
dudt = (f_interface(1:end-1) - f_interface(2:end)) / dx;
end
