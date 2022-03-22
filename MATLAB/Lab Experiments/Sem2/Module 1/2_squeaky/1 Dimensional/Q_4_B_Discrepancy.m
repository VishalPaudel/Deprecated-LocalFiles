
clc
clear
close all

average_scope = 3000;

n_f = 100;

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

plot((0:n_f), [0, hop_lst, 0] / average_scope)

life_expectancy_lst = zeros(1, n_f + 1);

E_m = @(m, n) m * (n - m);

for position = (0:n_f)
    life_expectancy_lst(position + 1) = E_m(position, n_f);
end

hold on
plot((0:n_f), life_expectancy_lst)

xlim([0, n_f])

xlabel("Varying Starting Positions")
ylabel("Steps to death (Steps)")

title(sprintf("Graph for %d sized island and %d times averaging", n_f, average_scope))
legend("Stochastic simulation", "Theoretical")
hold off

percent_discrepancy = 100 .* (life_expectancy_lst(1, 2:n_f) - (hop_lst / average_scope)) ./ life_expectancy_lst(1, 2:n_f);

figure()
plot((0:n_f), ([0, percent_discrepancy, 0]))

title(sprintf("Percent Discrepancy Graph for %d sized island and %d times averaging", n_f, average_scope))
xlabel("The starting positions")
ylabel("The discrepancy in % of original theoretical value")
