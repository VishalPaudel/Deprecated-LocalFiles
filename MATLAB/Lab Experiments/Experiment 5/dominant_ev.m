function [m_ev, v_EV] = dominant_ev(m_input, v_x_guess, f_tolerance, int_N)
    %LARGEST_EV Finds the most dominant eigen value
    %   This code uses power method with scaling
    %   The idea is that by infinite matrix multipliacation initial guess
    %   'BEND' toward the dominant eigen vector
    %   in other words cos(theta) tends to one or negative one
    %   Sufficient condition for convergence is diagonalizability
    %   wiki - Stochastic Matrix Transformations

    addpath '/Users/vishalpaudel/Documents/MATLAB/Lab_Experiments'
    % vishal_Rref
    % unit_vector

    m_ev = 0; % eigen value
    v_EV = []; % Eigen Vector

    if size(m_input, 1) ~= size(m_input, 2)
        disp('!! Trying to find eigenvalue of non-square matrix')
        return
    
    else
        [~, f_initial] = max(abs(v_x_guess));
        f_initial = v_x_guess(f_initial);
        
        if f_initial == 0
            disp('The guess was zero!')
            return
        end

        int_count = 0;
        while int_count < int_N
            
            v_x_next = m_input * v_x_guess;

            [~, m_ev] = max(abs(v_x_next));
            m_ev = v_x_guess(m_ev);
            
            if m_ev == 0
                disp('eigen value is 0')
                return
            end
            
            f_error = norm((v_x_next / m_ev) - v_x_guess, inf);
            if f_error < f_tolerance
                disp('Method converged in ' + string(int_count) + ' iterations')
                break
            end

            v_x_guess = v_x_next / (m_ev);
            int_count = int_count + 1;
        end
        if not(f_error < f_tolerance)
            disp('Method did NOT converge in ' + string(int_N) + ' iterations')
        end
        
        % ( A - l * I ) * x = 0
        
        v_EV = v_x_guess / m_ev;

        [~, f_eigen] = max(abs(eig(m_input)));
        f_actual_eig = eig(m_input);
        
        disp('The correct dominant eigenvalue of m_input is:')
        disp(f_actual_eig(f_eigen))
        
        disp('Verifying now: Ax - λx = ')
        disp((m_input * v_EV - m_ev * v_EV))
    end

end
