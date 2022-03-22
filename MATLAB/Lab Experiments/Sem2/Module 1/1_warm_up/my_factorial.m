function [factorial] = my_factorial(n)
    %MY_FACTORIAL Summary of this function goes here
    %   Detailed explanation goes here

    if n == 0 || n == 1
        factorial = 1;
    else
        factorial = n * my_factorial(n - 1);
    end
    
end
