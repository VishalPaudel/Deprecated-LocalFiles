function [x, y] = runge_kutta(f_1, f_2, t_0, x_0, y_0, n, t_n)
% I don't know what how this code finds the approximated solutions
% as of yet, got to find this out visually

    h = (t_n - t_0) / n;
    x = (x_0);
    y = (y_0);
    
    k = 1;
    while k <= n
        k_1 = h * f_1(t_0, x_0, y_0);
        s_1 = h * f_2(t_0, x_0, y_0);

        k_2 = h * f_1(t_0 + h/2, x_0 + k_1/2, y_0 +s_1/2);
        s_2 = h * f_2(t_0 + h/2, x_0 + k_1/2, y_0 +s_1/2);

        k_3 = h * f_1(t_0 + h/2, x_0 + k_2/2, y_0 +s_2/2);
        s_3 = h * f_2(t_0 + h/2, x_0 + k_2/2, y_0 +s_2/2);

        k_4 = h * f_1(t_0 + h, x_0 + k_3, y_0 + s_3);
        s_4 = h * f_2(t_0 + h, x_0 + k_3, y_0 + s_3);

        x_0 = x_0 + (k_1 + 2 * k_2 + 2 * k_3 + k_4)/6;
        y_0 = y_0 + (s_1 + 2 * s_2 + 2 * s_3 + s_4)/6;

        x(1, k) = x_0;
        y(1, k) = y_0;

        t_0 = t_0 + h;
        k = k + 1;
    end
    
end