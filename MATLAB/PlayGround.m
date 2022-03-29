

syms x y


U = 4;
I = 8;

p_y = 2;
p_x = 1;

expression1 = @(x, y) min([x, y.^2]) - U;
expression2 = p_x * x + p_y * y - I;
% expression2 = @(x, y) min([x, y.^2]) - 1;
% expression3 = @(x, y) min([x, y.^2]) - 16;

expression4 = @(x, y) y^2 - x;

f = ezplot(expression1, [0, 10, 0, 10]);
hold on
g = ezplot(expression2, [0, 10, 0, 10]);
% h = ezplot(expression3, [0, 10, 0, 10]);

i = ezplot(expression4, [0, 10, 0, 10]);
plot(4, 2, 'ok', 'LineWidth', 2)
% plot(1, 1, 'ok', 'LineWidth', 2)
% plot(16, 5, 'ok', 'LineWidth', 2)
% hold off

grid on;
grid minor;

title("The budget line Intersecting the Kink Locus")
xticks((0:2:30))
yticks((0:2:30))

xlim([0, 10])
ylim([0, 10])

set(f, 'LineWidth', 2, 'Color', 'black', 'linestyle','-.') 
set(g, 'LineWidth', 2, 'Color', 'black', 'linestyle','-') 
set(i, 'LineWidth', 2, 'Color', 'black', 'linestyle',':') 

legend("Indifference Curve: U = 4", "Budget Line: 1x + 2y = 8", "Kink Locus: x = y^2")
