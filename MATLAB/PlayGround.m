
syms x y


U = 20;
I = 24;

p_y = 2;
p_x = 1;

expression1 = 4 * x^0.5 + y - U;
expression2 = p_x * x + p_y * y - I;

f = ezplot(expression1, [0, U, 0, U]);
hold on
g = ezplot(expression2, [0, U, 0, U]);
plot(16, 4, 'ok', 'LineWidth', 2)
hold off

grid on;
grid minor;

title("The graph for budget equation")
xticks((1:2:30))
yticks((1:2:30))

set(gca,'LineWidth', 2)
set(f, 'LineWidth', 2, 'Color', 'black', 'linestyle',':') 
set(g, 'LineWidth', 2, 'Color', 'black') 

legend("Utility function", "Budget Equation")