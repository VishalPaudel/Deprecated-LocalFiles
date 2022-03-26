
clc
clear
close all

N = input("Please enter a positive integer: ");
B = input("Please enter a base: ");

size = 2 * N - 1;
main_lst = zeros(size);

main_lst(1, N + 1) = 1;


for row_index = (2:size)
    
    for column_index = (1:size)
        
        if column_index == 1

            main_lst(row_index, column_index) = main_lst(row_index - 1, column_index + 1);
        elseif column_index == size

            main_lst(row_index, column_index) = main_lst(row_index - 1, column_index - 1);

        else

            main_lst(row_index, column_index) = main_lst(row_index - 1, column_index - 1) + main_lst(row_index - 1, column_index + 1);

            fprintf("Added %d and %d", main_lst(row_index - 1, column_index - 1), main_lst(row_index - 1, column_index + 1))
        end
    end

end

disp(main_lst)

for iterator = (1:size * size)
    main_lst(iterator) = mod(main_lst(iterator), B);
    
%     if B == 2
%         if main_lst(iterator) == 1
%             main_lst(iterator) = A;
% 
%         elseif main_lst(iterator) == 0
%             main_lst(iterator) = C;
% 
%         end
%     end
end

% disp(main_lst)
imshow(main_lst, [])
