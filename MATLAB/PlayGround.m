
x = (0:0.05:2*pi); 
eps = 0.001;

y = sin(x/sqrt(eps))/sin(1/sqrt(eps)); 
figure, plot(x,y,'LineWidth',4);

xlabel('x');
ylabel('solution y(x)');

xlim([0 max(x)]);
ylim([-7 7])
