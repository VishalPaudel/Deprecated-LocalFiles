
n_i = 0;
m = 15;
n_f = 30;

current_index = m + 1;
num_hop = 1;

while current_index > n_i && current_index < n_f

    move = 2 * rand(1);

    if move < 1
        current_index = current_index - 1;

    elseif move >= 1
        current_index = current_index + 1;
    end

    num_hop = num_hop + 1;

    stem(current_index, 1)

    xlim([n_i, n_f - n_i + 1])
    
    M(num_hop) = getframe;

end

close()
disp(num_hop)