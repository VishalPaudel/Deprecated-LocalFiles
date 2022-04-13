% Monte Carlo Simulation of Compound Poisson process
clc
clear all
format long

lambda = 9;
claim_size = 10;
time = 1;

p_g_p_c = policy_simulation(time, lambda, claim_size);
