
% TODO: to make convergence visualizable by colour, even if only for 2-Dim

clear

m_input = [-15 4 3; 10 -12 6; 20 -4 2;];
f_tolerance = 0.01;
v_x_guess = [2 4 9]';
int_N = 30;

ev = [];
EV = [];

[ev(1), EV(:, 1)] = dominant_ev(m_input, v_x_guess, f_tolerance, int_N);

% other eigen values, can also be reached by different v_0 guesses,
% tolerances, this is a numerically method unstable as I have understood
% convergence has only been guaranteed for diagonalizable m_input

f_p = 6; %  Guess a eigen value
[ev(2), EV(:, 2)] = reverse_power_method(m_input, f_p, v_x_guess, f_tolerance, int_N);

f_p = -12; %  Guess a eigen value
[ev(3), EV(:, 3)] = reverse_power_method(m_input, f_p, v_x_guess, f_tolerance, int_N);

disp(EV)
disp(ev)

%   eigenvalue may get repeated approximately

clear f_tolerance
clear int_N
