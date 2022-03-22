function [m_rref, rank_] = vishal_Rref(m_input)
    m_rref = m_input;

    [int_rows, int_columns] = size(m_rref);

    index_row = 1;

    for index_column = (1:int_columns)

        if index_column > int_columns || index_row > int_rows
            break
        end

        temp_max = m_rref(index_row, index_column);

        for temp_index_row = (index_row: int_rows)
            int_max_row = index_row;

            if abs(m_rref(temp_index_row, index_column)) > abs(temp_max)
                temp_max = m_rref(temp_index_row, index_column);
                int_max_row = temp_index_row;
            end
        end
        
        if temp_max == 0
            continue
        else
            % changing the columns
            temp_row_holder = m_rref(index_row, :);
            m_rref(index_row, :) = m_rref(int_max_row, :);
            m_rref(int_max_row, :) = temp_row_holder;

            % reducing the pivot to 1
            
            m_rref(index_row, :) = m_rref(index_row, :)/m_rref(index_row, index_column);

            % reducing lower elements to zero
            for temp_row_index = (1:int_rows)
                if temp_row_index ~= index_row
                    m_rref(temp_row_index, :) = (m_rref(index_row, :))*(-1*((m_rref(temp_row_index, index_column))/(m_rref(index_row, index_column)))) + m_rref(temp_row_index, :);
                else
                    continue
                end
            end
            index_row = index_row + 1;
        end
    end

    rank_ = 0;
    for temp_index = (1 : size(m_rref, 1))
        for temp_inner = (1 : size(m_rref, 2))
            if m_rref(temp_index, temp_inner) == 1
                rank_ = rank_ + 1;
                break
            end
        end
    end
end
