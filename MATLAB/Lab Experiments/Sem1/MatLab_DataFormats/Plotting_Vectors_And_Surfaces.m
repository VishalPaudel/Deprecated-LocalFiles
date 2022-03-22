clc
clear all


v1 = [1; 2; 3;];
v2 = [-1; 2; 3;];

component_x = @(c1, c2) c1 * v1(1) + c2 * v2(1);
component_y = @(c1, c2) c1 * v1(2) + c2 * v2(2);
component_z = @(c1, c2) c1 * v1(3) + c2 * v2(3);

[C1, C2] = meshgrid(-5:1:5);

disp(component_x(1, 2))
disp(component_y(1, 2))
disp(component_z(1, 2))


figure
surf(component_x(C1, C2), component_y(C1, C2), component_z(C1, C2))

hold on
quiver3(0, 0, 0, v1(1), v1(2), v1(3))

quiver3(0, 0, 0, v2(1), v2(2), v2(3))
hold off

shading('interp')
grid on
view(0, 90)