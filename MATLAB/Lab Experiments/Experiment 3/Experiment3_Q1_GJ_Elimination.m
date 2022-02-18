
% This is to view various methods of solving systems of linear equations

% Direct Method (Gauss Jordan Elimination)
m_given = [1 2; 3 4;];
f_constants = [2 3;]';

m_given_augmented = [];

for i = (1:size(m_given, 1))
    m_given_augmented(i, 1:size(m_given, 2)) = m_given(i, :);
    m_given_augmented(i, size(m_given, 2) + 1) = f_constants(i);
end

m_given_augmented_rref = vishal_Rref(m_given_augmented);

disp(m_given_augmented_rref)
disp(rref(m_given_augmented))

answer = m_given_augmented_rref(:, size(m_given_augmented_rref, 2));

disp('Your answer (x) for Ax = b is: ')
disp(answer)
