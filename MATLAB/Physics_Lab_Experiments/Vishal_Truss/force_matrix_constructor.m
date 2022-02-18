function [m_constant] = force_matrix_constructor(m_joints_cord, m_forces_location)
    %CONSTANTS_MATRIX_CONSTRUCTOR Summary of this function goes here
    %   Detailed explanation goes here
    
    dimensions = size(m_joints_cord, 2) - 1;
    number_joints = size(m_joints_cord, 1);

    m_constant(1:(dimensions * number_joints), 1) = 0;
    
    force_iterator = 1;
    while force_iterator <= size(m_forces_location, 1)
        forced_joint = m_forces_location(force_iterator, 1);
        force_vector = m_forces_location(force_iterator, 2:end-1);
        
        force_vector = m_forces_location(force_iterator, end) * unit_vector(force_vector);

        for dimension_iterator = (1:dimensions)
            % It is minus becaus Ax = b and not Ax + b = 0, b = m_constant
            m_constant(dimensions * (forced_joint - 1) + dimension_iterator) = m_constant(dimensions * (forced_joint - 1) + dimension_iterator) - force_vector(1, dimension_iterator);
        end

        force_iterator = force_iterator + 1;
    end
end

