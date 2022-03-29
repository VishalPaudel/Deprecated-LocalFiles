
function [l_hat] = expectation_of_money(t)
    
    lambda = 5;
    
    N = 10^5;
    
    beer_price = 300;
    
    beer(1, N) = 0;
    
    for i=(1:N)
        n = poissrnd(lambda * t);

        if n > 0
            coins(1, n) = 0;

            for j=(1:n)
                U = rand(1);
    
                if U < 0.4
                    money = 5;
                elseif U < 0.8
                    money = 10;
                elseif U < 1
                    money = 20;
                end
    
                coins(1, j) = money;
            end
        end
        
        if sum(coins) >= beer_price
            beer(1, i) = 1;
        end
    end
    
    l_hat = mean(beer);
    
%     relErr_hat = std(beer) / (l_hat * sqrt(N));
end
