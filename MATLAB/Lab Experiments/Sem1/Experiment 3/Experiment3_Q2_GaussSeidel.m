
m_main = [3 1 1; 1 3 1; 1 1 3;];

m_b = [1 2 3]';

m_guess = [0; 0.5; 1;];

int_number_iterations = 10000;

tolerance = 0.001;

Final_guess = vishal_gauss_seidel(m_main, m_b, m_guess, int_number_iterations, tolerance);

clear