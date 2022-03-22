
clc
clear
close all

average_scope = 300;

n_f = 30;

hop_lst(1, n_f - 1) = 0;


average_iterator = 1;

while average_iterator < average_scope
    % This runs for averaging
    position_iterator = 1;

    while position_iterator < n_f
        % This runs for the positions from 1 to (n_f - 1)

        [hops, ~] = Q1_A_squeaky_1D(n_f, position_iterator);

        hop_lst(position_iterator) = hop_lst(position_iterator) + hops;

        position_iterator = position_iterator + 1;

    end

    average_iterator = average_iterator + 1;
end

plot((1:n_f - 1), hop_lst / average_scope)

xlim([0, n_f])

title(sprintf("Graph for %d sized island and %d times averaging", n_f, average_scope))
xlabel("The initial positions")
ylabel("Number of Steps to death")
