function [F] = test_function(x)

    N = 1000;
    F = 0;

    for i = (1:N)
        F = F + (((-1)^(i + 1) .* x .^ i) ./ factorial(i));
    end
