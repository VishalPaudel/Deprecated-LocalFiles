% % % b(1) = T_a,  b(2) = k
Tfcn = @(b,t,T_0) (T_0 - b(1)).*exp(b(2).*t) + b(1);
tv = [  0;  5; 10];
Tv = [100; 80; 65];
p = fminsearch(@(b) norm(Tv - Tfcn(b,tv,Tv(1))), [10; 1]);      % Estimate Parameters
Final_T = Tfcn(p,15,Tv(1));                                     % Temperature @ 15 Minutes
Final_t = fzero(@(t) Tfcn(p,t,Tv(1)) - 25, 1);                  % Time To Reach 25°C
time = linspace(min(tv),Final_t);
Tfit = Tfcn(p,time,Tv(1));
figure
plot(tv, Tv, 'p')
hold on
plot(time, Tfit, '-r')
hold off
grid
xlabel('Time (min)')
ylabel('T (°C)')