r = 0.5;

x = @(n) (1 - (r .^ n)) / (1 - r);

plot(linspace(0, 100, 101), x(linspace(0, 100, 101)))

% I want something like
% n = 100;
% 
% list = [];
% 
% for i = (1:n)
%     list(1, i) = i;
% end
% 
% disp(list)
% 
% x = @(n) sum( 0.5 .^ list(n));
% plot([], x([])