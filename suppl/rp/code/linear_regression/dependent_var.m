close all

N = 1000;
W1 = rand(1,N);
W2 = rand(1,N);
X = W1;
Y = 9/10*W1+1/10*W2;

%% Original RV
figure(1)
plot(W1,W2,'.')
axis([0 1 0 1],'equal')
box off
xlim([0 1])
xlabel('W_1')
ylabel('W_2')

%% Numerical
E1 = mean(X);
E2 = mean(Y);
C12 = mean(X.*Y) - E1*E2;
V1 = var(X);
V2 = var(Y);
rho = C12/sqrt(V1*V2);
%C12/V1

%% Dependent RV
figure(2)
plot(X,Y,'.')
grid on
hold on
Yh = E2+C12/V1*(X-E1);
%Yh = 1/2+9/10*(X-1/2);

plot(X,Yh,'LineWidth',2)
axis equal
xlabel('X')
ylabel('Y')
hold off
xlim([0 1])
ylim([0 1])
%% Error 
e = Y-Yh;
mse = e*e'/N;
mse_theory = 1/1200;