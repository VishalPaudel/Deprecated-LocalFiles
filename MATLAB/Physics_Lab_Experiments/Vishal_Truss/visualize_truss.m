
function [] = visualize_truss(m_joints_cord)
    %VISUALIZE_TRUSS Summary of this function goes here
    %   Detailed explanation goes here
   
    for i = (1:size(m_joints_cord, 1))
        % Plotting the points
        point = m_joints_cord(i, 2:end);
        dimensions = size(m_joints_cord, 2) - 1;
        
        if dimensions == 2

        elseif dimensions == 3

        else
            disp('Out of my visualisation bounds as of now...')
            disp('...Working on a volumetric cross section for dim >= 4')
            break
        end
    end
end
