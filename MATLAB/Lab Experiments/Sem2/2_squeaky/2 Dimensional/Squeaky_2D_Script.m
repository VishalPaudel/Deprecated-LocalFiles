% squeaky 2D script
grid_length = 5;

N = 30;
n = zeros(N);

z = zeros(grid_length+1);

for j = (0:grid_length)

    start_pos_x = j;

    for k = 0:grid_length
        
        start_pos_y = k;

        for i = (1:N)
            n(i) = Squeaky_2D_Simulator(grid_length, start_pos_x, start_pos_y);
        end
    end
    avg = mean(n);
    z(j+1) = avg(1);

end

Z = (z);

for i=1:size(z)-1
    Z = [Z z];
end
surf(Z)
