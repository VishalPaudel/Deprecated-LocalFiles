
clear
clc
close all

island_range = (15:30);

initial_position = 7;

average_scope = 300;

hops_lst(1:(size(island_range, 2))) = 0;

disp(hops_lst)

iteration_count = 1;
for island_size = island_range

    num_hops = 0;

    for average_iteration = (1:average_scope)
        
        [num_hop_to_death, ~] = Q1_A_squeaky_1D(island_size, initial_position);
        
        num_hops = num_hops + num_hop_to_death;
    end

    num_hops = num_hops / average_scope;

    hops_lst(iteration_count) = num_hops;

    disp(size(island_range))
    disp(size(hops_lst))
    plot(island_range, hops_lst)

    M(iteration_count) = getframe();

    iteration_count = iteration_count + 1;

end

xlim([island_range(1), island_range(end)])

xlabel("Island Size")
ylabel("The average Number of steps to death.")

title(sprintf("Fixed initial position %d, island size from %d to %d for %d times average", initial_position, island_range(1), island_range(end), average_scope))
