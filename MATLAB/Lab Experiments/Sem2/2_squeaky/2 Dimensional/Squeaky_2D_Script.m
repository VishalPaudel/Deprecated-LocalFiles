
limit_lst = [40, 50];


[X_points, Y_points] = meshgrid((0:limit_lst(1)), (0:limit_lst(2)));
NUM_DEATH_LST = zeros(limit_lst(2) + 1, limit_lst(1) + 1);


average_scope = 30;
for average_iterator = (1:average_scope)

    NUM_TEMP = zeros(limit_lst(2) + 1, limit_lst(1) + 1);

    for grid_iterator = (1:((limit_lst(1) + 1) * (limit_lst(2) + 1)))
    
        starting_position(1) = X_points(grid_iterator);
        starting_position(2) = Y_points(grid_iterator);
        
            
        [NUM_DEATH, ~] = Squeaky_2D_Simulator(starting_position, limit_lst);
    
        NUM_TEMP(grid_iterator) = NUM_DEATH;
    
    end

    NUM_DEATH_LST = NUM_DEATH_LST + (NUM_TEMP / average_scope);

    surf(X_points, Y_points, NUM_DEATH_LST)

    M(grid_iterator) = getframe();

end
