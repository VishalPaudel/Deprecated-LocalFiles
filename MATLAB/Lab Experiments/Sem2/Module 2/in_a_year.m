
function [money] = in_a_year()

    money = 0;

    lambda_lst = [2, 3, 1, 3];

    for quarter = (1:4)

        money = money + in_a_quarter(lambda_lst(quarter));
    end

end

