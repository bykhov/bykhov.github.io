close all

N = 1e6;
x1 = randn(1,N)*.5;
x2 = randn(1,N);
y1 = x1;
y2 = 9/10*x1.^2+1/10*x2;

%% Numerical
E1 = mean(y1);
E2 = mean(y2);
C12 = mean(y1.*y2) - E1*E2;
V1 = var(y1);
V2 = var(y2);
rho = C12/sqrt(V1*V2)
%C12/V1

%% Dependent RV
figure(2)
plot(y1,y2,'.')
axis equal
grid on

hold on
Yh = E2+C12/V1*(y1-E1);
plot(y1,Yh,'LineWidth',2)
xlabel('X')
ylabel('Y')


