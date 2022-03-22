
E_m = @(m, n) m * (n - m);

grid_length = 15;

life_expectancy_lst = zeros(1, grid_length + 1);

for position = (0:grid_length)
    life_expectancy_lst(position + 1) = E_m(position, grid_length);
end

plot((0:grid_length), life_expectancy_lst)

xlabel("Varying Starting Positions")
ylabel("Theoretical Expected Life Span (Steps)")

title(sprintf("Theoretical Calculation of Expected number of steps to death for grid length %d", grid_length))
