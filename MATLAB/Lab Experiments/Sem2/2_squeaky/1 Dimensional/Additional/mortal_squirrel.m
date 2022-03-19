
function [m_distribution] = mortal_squirrel(num_iterations, island_size, initial_position)

    m_distribution = zeros(1, island_size + 1);

    position_lst = (0:island_size);

    m_distribution(1, initial_position + 1) = 1;

    iterator = 1;

    left_death_lst = zeros(1, num_iterations);
    right_death_lst = zeros(1, num_iterations);

    left_death_lst(iterator) = m_distribution(1);
    right_death_lst(iterator) = m_distribution(end);


    while iterator < num_iterations

        iterator = iterator + 1;
        disp(m_distribution)

        old_distribution = m_distribution(:);

        for inner_iterator = (1:island_size + 1)

            if inner_iterator == 1 || inner_iterator == 2
                m_distribution(inner_iterator) = 0.5 * old_distribution(inner_iterator + 1);
%                 fprintf("---Near left cliff, took %d\n", old_distribution(inner_iterator + 1))

            elseif inner_iterator == island_size || inner_iterator == island_size + 1

                m_distribution(inner_iterator) = 0.5 * old_distribution(inner_iterator - 1);
%                 fprintf("Near right cliff, took %d\n\n", old_distribution(inner_iterator - 1))


            else

                m_distribution(inner_iterator) = 0.5 * (old_distribution(inner_iterator - 1) + old_distribution(inner_iterator + 1));
%                 fprintf("IN MIDDLE, took %d and %d\n", old_distribution(inner_iterator - 1), old_distribution(inner_iterator + 1));
            end

            left_death_lst(iterator) = m_distribution(1);
            right_death_lst(inner_iterator) = m_distribution(island_size + 1);
        end

        plot(position_lst, [sum(left_death_lst), m_distribution(1, 2 : island_size - 1), sum(right_death_lst)])

        M(iterator - 1) = getframe();

    end
end
