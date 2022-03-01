
% This code is checking wether a vector V is in the column space of a
% matrix M

% We do this by finding the solution of MX = V, via gauss-jordan method,
% rref

V1_R5 = [1 2 -3 4 -5];

a = [3 4 -7 2 -4]';
b = [2 3 -6 2 -1]';
c = [4 -2 3 9 -4]';
A = [a b c];

A_rref = vishal_Rref(A);

A_augmented = [a b c V1_R5];

A_augmented_rref = vishal_Rref(A_augmented);

count_pivots = 0;
for row_index = (1:size(A_augmented, 1))
    
end
