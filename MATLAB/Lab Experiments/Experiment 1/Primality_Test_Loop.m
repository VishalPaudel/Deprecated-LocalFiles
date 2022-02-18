clc
clear all

A(1) = 2;

count = 2;

N = input('Enter a upper limit: ');

for i = 3:N

    for j = 2:ceil(i/2)
        flag = 1;

        if mod(i, j) ~= 0

            continue
        else
            flag = 0;
            break


        end
    
    end

    if flag == 1
        A(length(A)+1) = i;

    count = count + 1;
    end

end

disp(A)
