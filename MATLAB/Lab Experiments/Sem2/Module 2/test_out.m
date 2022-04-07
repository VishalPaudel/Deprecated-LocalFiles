money_in_a_year = 0;

average_scope = 10^6;

for year_iterator = (1:average_scope)
    money_in_a_year = money_in_a_year + in_a_year();
end

money_in_a_year = money_in_a_year / average_scope;

disp(money_in_a_year)


% Comparing to the theoretical results
m_x = 4/3;
m_n = @(lambda) lambda;

theoretical_answer = 0;

lambda_lst = [2, 3, 1, 3];

for quarter = (1:4)
    theoretical_answer = theoretical_answer + m_x * m_n(lambda_lst(quarter));
end

disp(theoretical_answer)
