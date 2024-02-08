clearvars
close all
%rng(1)

n = 500;
N = 1e5;

w = (randi(2,[n N])-1.5)*2;
x = sum(w);
%%
figure(1)
stem(w(1,1:50))
xlabel('n')
ylabel('{\bf w}[n]')
grid on
%%
figure(2)
stem(cumsum(w(1,1:50)))
xlabel('n')
ylabel('{\bf x}[n]')
grid on
%%
E_x = mean(x);
disp(['Mean: Theory = 0, Simulation = ' num2str(E_x)])% =? 0
Var_x = var(x); % =? n
disp(['Variance: Theory = ' num2str(n) ', Simulation = ' num2str(Var_x)])% =? 0
%%
figure(3)
histogram(x,-74:2:74,'Normalization','pdf')
hold on
z = linspace(-3*sqrt(Var_x),3*sqrt(Var_x));
plot(z,pdf('normal',z,E_x,std(x)),"LineWidth",1.5)
grid on
xlabel('x')
ylabel('f_X(x)')
set(gcf, 'Color', 'w');
set(gca,'FontSize',13)