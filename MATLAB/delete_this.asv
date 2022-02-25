A = [
    0 0.5 0 0;
    0.5 0 0 0;
    0.5 0.5 0 1;
    0 0 1 0;
    ];

jumpers = 0.2;

B = (jumpers/4) * ones(size(A)) + (1 - jumpers) .* A;

disp(A)
disp(B)

v_input = (input('Enter a distribution vector'))';

error = 1;
tolerance = 0.0005;

x_old = [v_input v_input];
disp(x_old)

while error > tolerance || error_ > tolerance
    Stabilise = [x_old(1) x_old(2)];
    x_old = [A * Stabilise(:, 1), B * Stabilise(:, 2)];
    disp(x_old)

    error = norm(Stabilise(1) - x_old(1));
    error_ = norm(Stabilise(2) - x_old(2));
end

disp(x_old)

