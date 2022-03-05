wavelength = 4.5 * 10 ^ -9;

k = (2 * pi) / wavelength;

num_fringes = 3000;

dist_d = (num_fringes * wavelength / 2);

theta = 10 * (pi / 180);
N = 50;
x_D = linspace(-5, 5, N);
z_D = linspace(-5, 5, N);

E_0 = 5;
S_0 = 4 * (E_0) ^ 2;

S_D(1:N, 1:N) = 0;

for i = [1:N];
    for j = [1:N];
        S_D(i,j) = S_0 * cos(k * (dist_d - (x_D(i) / 2) * sin(theta) + z_D(j) * sin(theta / 2) ^ 2)) ^ 2
    end
end

[x_D, z_D] = meshgrid(x_D, z_D);

figure(1)
contourf(x_D, z_D, S_D)

title('Interference patterns')

xlabel('X')
ylabel('Z')

colourbar()
