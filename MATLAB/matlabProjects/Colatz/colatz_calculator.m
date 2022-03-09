function [count] = colatz_calculator(value, prime)
    %COLATZ_CALCULATOR Summary of this function goes here
    %   Detailed explanation goes here

    count = 0;
    
    max_value = 0;
    
    value_array = [];
    
    while true

        if value == 1
            break
        elseif mod(value, 2) == 0
    
            if value > max_value
                max_value = value;
            end
    
            value = value / 2;
            count = count + 1;
    
        else
            value = prime * value + 1;
    
            if value > max_value
                max_value = value;
            end
            count = count + 1;
        end
    
        value_array(count) = value;
    
%         plot((1:1:count), value_array)
%     
%         xlim([count - 100, count + 100])
%         ylim([value - 100, value + 100])
%     
%         M(count + 1) = getframe;

    end

    close()

end

