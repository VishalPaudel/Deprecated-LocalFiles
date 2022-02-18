function [Q, R, X] = gramSchmidt_QR(m_input, v_b)

    Q = double.empty();
    R = double.empty();
    X = double.empty();

    [~, rank] = vishal_Rref(m_input);

    if rank ~= size(m_input, 2)
        
        fprintf('Uh oh! The coloumns are linearly dependent')

    else
        % The u1 vector is V1 / norm(V1)
        Q(:, 1) = (unit_vector(m_input(:, 1)));

        for column_index = (2: (size(m_input, 2)) )
            % Goes through all the columns of m_input
            
            v_projection = zeros( (size(m_input, 1)) , 1);
            v_current = (m_input(:, column_index));

            for inner_index = (1 : column_index - 1)
                r_dot = v_current' * Q(:, inner_index);
                v_projection = v_projection + r_dot * Q(:, inner_index);
            end

            Q(:, column_index) = unit_vector(v_current - v_projection);
        end


        for i = (1 : size(m_input, 2))
            for j = (1 : size(m_input, 2))
                if i <= j
                    R(i, j) = m_input(:, j)' * Q(:, i);
                else
                    R(i, j) = 0;
                end
            end
        end

        v_b = (Q)' * v_b;
        n = size(R, 2);
        X(n, 1) = 0;
    
        for i = (n : -1 : 1)
            sum = 0;
    
            for j = (n : -1 : i + 1)
                sum = sum + R(i, j) * X(j, 1);
            end
    
            if R(i, i) == 0
                disp('System is indeterminate')
            else
                X(i, 1) = (v_b(i, 1) - sum) / R(i, i);
            end
        end

    end
