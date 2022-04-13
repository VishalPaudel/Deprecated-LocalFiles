% Monte Carlo Simulation of Compound Poisson process
clc
clear all
format long
 
arr=[];

time = 15;

for t = (1:time)

    l_hat = Plain_Simulation(t);

    arr = [arr l_hat];

end


disp arr_plot;
plot((1:time), arr);
xlabel("Number of hours");
ylabel("probability of getting a beer");
