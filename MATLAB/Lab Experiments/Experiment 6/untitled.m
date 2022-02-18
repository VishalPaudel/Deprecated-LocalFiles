function [x, y] = runge_kutta(f_1, f_2, t_0, x_0, y_0, n, t_n)
    h = (t_n - t_0) / n;
    x = (x_0);
    y = (y_0);
    
    k = 1;
    while k <= n
        k_1 = h * f_1(t_0, x_0, y0);
        s_1 = h * f_2(t_0, x_0, y0);

        k_2 = h * f_1(t_0 + h/2, x_0 + k_1/2, y_0 +s_1/2);
        s_2 = h * f_2(t_0, x0, y0);

end