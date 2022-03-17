n_i = 0;
n_f = 200;

initial_position = 100;

num_hop = 0;

if initial_position < n_f && initial_position > n_i

    m = initial_position;
    current_index = m + 1;
    
    
    while current_index > n_i + 1 && current_index < n_f + 1
    
        move = 2 * rand(1) - 1;
    
        if move < 0
            current_index = current_index - 1;
    
        elseif move >= 0  % Silently taking move = 0 case here
            current_index = current_index + 1;
        end
    
        num_hop = num_hop + 1;

        stem(current_index, 1)

        xlim([n_i, n_f - n_i + 1])
        
        M(num_hop) = getframe;
    
    end

else
    error('Please enter a starting position between 0 and island size')
end

close()
disp("Number of steps taken to die ")
disp(num_hop)

if current_index <= n_i + 1
    disp("Left Death")

elseif current_index > n_f
    disp("Right Death")
end
