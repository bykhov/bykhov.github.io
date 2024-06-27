clearvars

L = 1e2;
sigma = 0.1;

a = [1  -1.5  0.7];
b = [0 1 0.5];

x = randi(2,L,1)-1;
y = filter(b,a,x+sigma*randn(size(x)));

sys = arx(x,y,[2 2 1])
compare([y x],sys,1)
fontsize(gcf,14,'points')
fontname(gcf,"Times New Roman")
grid on
exportgraphics(gcf,'arx_example.pdf')