function [m_coefficeients] = coefficient_matrix_constructor(m_joints_cord, m_rods_relation, m_reactions)
    % Constructs the system of equations in a matrix form.
    dimensions = width(m_joints_cord) - 1;
    fprintf("You are dealing with " + string(dimensions) + " dimensional truss\n\n")
    
    if dimensions * length(m_joints_cord) ~= length(m_reactions) + length(m_rods_relation)
        disp("A statistically indeterminate problem")
    else
        disp("A statistically determinate problem")
    end


    m_coefficeients = [];
    disp("Starting the construction of the coefficient or the direction matrix")

    joint_index = 1;
    while joint_index <= size(m_joints_cord, 1)
    
        % Rows dedicated to each dimension
        dimension_index = 1;
        while dimension_index <= dimensions
            row_index = dimensions * (joint_index - 1) + dimension_index;
    
            % Creating an empty container at row_index
            m_coefficeients(row_index, 1:(size(m_rods_relation, 1) + size(m_reactions, 1))) = 0;
            
            column_index = 1;
            while column_index <= size(m_rods_relation, 1)
                for inner_check_index = (1:2)
                    % Checking wether this joint joint_index is connected by
                    % this rod column_index
    
                    if m_rods_relation(column_index, inner_check_index + 1) == joint_index
                        is_inside = true;
                        break
                    end
    
                    is_inside = false;
                end
                
                if is_inside
                    % For the same parity, joint 2 --> joint 3, then next 3 --> 2
                    if m_rods_relation(column_index, 2) == joint_index
                        first_joint = m_joints_cord(m_rods_relation(column_index, 3), 2:end);
                        second_joint = m_joints_cord(m_rods_relation(column_index, 2), 2:end);
                    elseif m_rods_relation(column_index, 3) == joint_index
                        first_joint = m_joints_cord(m_rods_relation(column_index, 2), 2:end);
                        second_joint = m_joints_cord(m_rods_relation(column_index, 3), 2:end);
                    end
                    
                    unit_coefficient = unit_vector(first_joint - second_joint);

                    m_coefficeients(row_index, column_index) = unit_coefficient(1, dimension_index);
                end
    
                column_index = column_index + 1;
            end
    
            while column_index <= size(m_rods_relation, 1) + size(m_reactions, 1)
                reaction_iterator = column_index - size(m_rods_relation, 1);
                
                reaction_joint = m_reactions(reaction_iterator, 1);
                reaction_vector = m_reactions(reaction_iterator, 2:end);
                
                unit_coefficient = unit_vector(reaction_vector);
                if joint_index == reaction_joint
                    m_coefficeients(row_index, column_index) = unit_coefficient(1, dimension_index);
                end
    
                column_index = column_index + 1;
            end
    
            dimension_index = dimension_index + 1;
        end
    
        joint_index = joint_index + 1;
    end
end

