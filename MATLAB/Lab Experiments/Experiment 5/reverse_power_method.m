function [f_ev, v_EV] = reverse_power_method(m_input, f_p, v_guess, f_tolerance, int_N)
    %REVERSE_POWER_METHOD finding an eigenvalue close to given guess
    %   Suppose λ_k is the (unknown) eigenvalue of A closest to p.
    %   We know that if λ1, λ2, . . . , λn are the
    %   eigenvalues of A then λ_1 − p, λ_2 − p, . . . , λ_n − p
    %   are the eigenvalues of the matrix A − pI. Thenλ_k−p will be
    %   the smallest magnitude eigenvalue of A−pI but 1 / (λ_k − p)
    %   will be the largest magnitude eigenvalue of (A − pI) ^ -1
    %   Hence if we apply the power method to (A − pI)^-1 we can obtain λ_k.
    %   The method is called the shifted inverse power method.
    
    if size(m_input, 1) ~= size(m_input, 2)
        return
    else
        int_size = size(m_input, 1);

        %   m_augment(1:int_size, 1:int_size) = (m_input - f_p * eye(int_size));
        %   m_augment(1:int_size, int_size + 1 : 2 * int_size) = eye(int_size);
        %   m_augment = vishal_Rref(m_augment);
        %   m_augment = m_augment(1:int_size, int_size + 1 : 2 * int_size);
        %   This much to find A^-1 or inv(A), may not have an inverse!
        
        m_augment = inv(m_input - f_p * eye(int_size));

        %   Checking for if A^-1 is valid or not
        if (m_input - f_p * eye(int_size)) * m_augment ~= eye(int_size)
            disp('Inverse did not exist for this A - pI')
            return
        else

            [f_ev, v_EV] = dominant_ev(m_augment, v_guess, f_tolerance, int_N);
            f_ev = (1 / f_ev) + f_p;
        end
    end
end

