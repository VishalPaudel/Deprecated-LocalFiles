
function [num_steps_to_death, directional_death] = Squeaky_2D_Simulator(start_position_lst, limit_lst)
    
    num_steps_to_death = 0;
    
    directional_death = 0;
    
    % Only considering the simple case for equal choices
    
    x_position = start_position_lst(1);
    y_position = start_position_lst(2);
    
    x_lim = limit_lst(1);
    y_lim = limit_lst(2);
    
    while (x_position < x_lim && x_position > 0) && (y_position < y_lim && y_position > 0)
        
        move_y_or_x = 2 * rand(1) - 1;
    
        if move_y_or_x < 0
            % Moving in x
    
            move_select = 2 * rand(1) - 1;
    
            if move_select > 0
                % moving in +ve x direction
    
                x_position = x_position + 1;
                directional_death = 1;
    
            elseif move_select < 0
                % moving in -ve x direction
    
                x_position = x_position - 1;
                directional_death = -1;
    
            else
                disp("This is unexpected!")
                return
            end
    
        elseif move_y_or_x > 0
            % Moving in y
    
            move_select = 2 * rand(1) - 1;
    
            if move_select > 0
                % moving in +ve y direction
    
                y_position = y_position + 1;
                directional_death = 1i;
    
            elseif move_select < 0
                % moving in -ve y direction
    
                y_position = y_position - 1;
                directional_death = -1i;
    
            else
                disp("This is unexpected!")
                return
            end
        else
            disp("This is unexpected!")
            return
    
        end
    
%         plot(x_position, y_position, 'bo')
% 
%         xlim([0, x_lim])
%         ylim([0, y_lim])
    
        num_steps_to_death = num_steps_to_death + 1;
    
%         M(num_steps_to_death) = getframe();
        
    end

%     fprintf("Death after %d\n through", num_steps_to_death)
%     disp(directional_death)

end
