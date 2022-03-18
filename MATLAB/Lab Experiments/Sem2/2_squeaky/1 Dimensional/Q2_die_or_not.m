% Inferring if he dies on the 31st or not

island_size = 10;

start_position = 5;

num_times_repeat = 30;

for i = (1:num_times_repeat)
    
    [~, death_note] = Q1_A_squeaky_1D(island_size, start_position);
    
    if death_note == 1 || death_note == -1
        fprintf("Died on the %d Run\n", i)
    
    else
        disp('Did not die this time')
    end
end
