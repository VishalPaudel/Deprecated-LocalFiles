function [l_hat] = Plain_Simulation(t)
% Monte Carlo Simulation of Compound Poisson process
    
    lambda = 5;

    time = t;
    
    N = 10^4;  % Average Scope
    
    beer_price = 350;  % Minimum price
    beer = zeros(N,1);  % Creating an Array to Record the Experiment
    
    
    for i=1:N
        n = poissrnd(lambda*time);
    
        if n > 0
            coins = zeros(n,1);
    
            for j=1:n
                U = rand(1);
    
                if U<=0.4
                    coins(j) = 5;
                elseif U>=0.8
                    coins(j) = 20;
                else
                    coins(j) = 10;
                end
            end
        end
    
        if sum(coins)>=beer_price
            beer(i) = 1;
        else
            beer(i) = 0;
        end
    end
    
    l_hat = mean(beer);  % l_hat = P(X3 >= beer_price)
    relErr_hat = std(beer) / (l_hat * sqrt(N)); % relative error of l_hat by crude Monte Carlo simulation
end