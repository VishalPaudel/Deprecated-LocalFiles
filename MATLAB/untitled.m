T = (1:1:10);

hold on
for t = T
    plot(t, expectation_of_money(t), 'ok-')
end
