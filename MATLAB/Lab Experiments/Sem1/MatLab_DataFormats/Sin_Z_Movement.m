clear all
clc
z=peaks;

for j = 1:1000
    x = sin(j*pi/10)*z;
    surf(x,z)
    drawnow
    M(j) = getframe;
end