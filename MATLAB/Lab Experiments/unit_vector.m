function [v_normalized] = unit_vector(v_input)
    %UNIT_VECTOR Outputs a unit vector in the direction of the input vector
    %   v_normalized = v_input / norm(v_input)
    %   not checking for type of input
    
    v_norm = norm(v_input);

    if v_norm ~= 0
        v_normalized = v_input / v_norm;
    else
        v_normalized = v_input;
    end
end
