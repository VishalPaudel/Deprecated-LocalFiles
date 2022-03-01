function [m_guess] = vishal_gauss_seidel(m_main, m_b, m_guess, int_number_iterations, tolerance)

    int_size = size(m_main);

    if int_size(1) == int_size(2)
        disp('The matrix is a square matrix')
        int_size = int_size(1);
    end
    
    int_size_b = size(m_b);
    
    if int_size_b(2) == 1 && int_size_b(1) == int_size
        disp('The b is reachable from main matrix transformation on some x')
        disp('')
    end

    % Constructing the T
    T = [];
    
    for row_number = (1:int_size)
        T(row_number, 1:int_size) = -1 * (m_main(row_number, 1:int_size)) / (m_main(row_number, row_number));
        T(row_number, row_number) = 0;
    
        m_b_iteration(row_number, 1) = (m_b(row_number, 1))/(m_main(row_number, row_number));
    end
    
    for iterator = (1:int_number_iterations)
        m_temp = m_guess;
        m_guess = T * m_guess + m_b_iteration;

        field_norm = max(abs(m_guess - m_temp));
    end

    if field_norm < tolerance
        disp('Starting guess works, method passes')
    else
        disp('Method Fails !?')
    end

    disp(m_guess)

    disp(m_main * m_guess)
end
