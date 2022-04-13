function [l_hat] = policy_simulation(time, lambda, policy_claim_price)
% Monte Carlo Simulation of Compound Poisson process
    
    N = 10^6;  % Average Scope
    
    beer = zeros(N,1);  % Creating an Array to Record the Experiment
    
    
    for i=(1:N)
        n = poissrnd(lambda*time);
    
        if n >= 0
            coins = zeros(n,1);
    
            for j=1:n
                U = rand;
    
                if U <= 1/3
                    coins(j) = 2;
                else
                    coins(j) = 1;
                end
            end
        end
    
        if sum(coins) > policy_claim_price
            beer(i) = 1;
        else
            beer(i) = 0;
        end
    end
    
    l_hat = mean(beer);  % l_hat = P(X3 >= beer_price)
    relErr_hat = std(beer) / (l_hat * sqrt(N)); % relative error of l_hat by crude Monte Carlo simulation

    disp("The calculated probability")
    disp(l_hat)
end