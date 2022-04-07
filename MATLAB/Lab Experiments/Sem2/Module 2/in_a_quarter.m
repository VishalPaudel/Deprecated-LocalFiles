
function [money] = in_a_quarter(lambda)
    
    money = 0;
    prob_100k = 2/3;

    num_person = poissrnd(lambda);

    for person = (1:num_person)
        
        rand_coverage = randi(3)/3;

        if rand_coverage < 1 - prob_100k
        
            money = money + 1;

        elseif rand_coverage >= prob_100k
            
            money = money + 2;
        else
            disp("Something went wrong inside person loop")
            return;
        end

    end

end
