
function [N] = Squeaky_2D_Simulator(grid_length, start_pos_x, start_pos_y)

    curr_pos_x = start_pos_x;
    curr_pos_y = start_pos_y;

    N = 1;

    while (curr_pos_x > 0 && curr_pos_x < grid_length && curr_pos_y > 0 && curr_pos_y < grid_length)
        toss = rand(1);

        if(toss < 0.5)
            toss = rand(1);
            if(toss < 0.5)
                curr_pos_x = curr_pos_x - 1;
            else
                curr_pos_x = curr_pos_x + 1;
            end

        else
            toss = rand(1);
            if(toss < 0.5)
                curr_pos_y = curr_pos_y - 1;
            else
                curr_pos_y = curr_pos_y + 1;
            end
        end

        N = N + 1;
        scatter(curr_pos_x, curr_pos_y);
        xlim([0, grid_length])
        ylim([0, grid_length])
        %getframe();
    end
end