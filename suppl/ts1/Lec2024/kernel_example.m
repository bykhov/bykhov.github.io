clear all
close all
rng(1) % initialization of random generator for a repeatability

% default figure configurations
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultAxesFontName','Times New Roman')
set(groot,'defaultAxesFontSize',12)
set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')

%% Dataset
M_train = 10;   % train dataset size
sigma = 0.1;    % noise std
x_train = random('Uniform',0,0.6,M_train,1);    % x of the train dataset
p_coeff = [0.1 3 1 0.2 0.01];                   % theoretical polynomial coefficients
y_theory_train = polyval(p_coeff,x_train);      % theoretical function y=f(x)
y_train = y_theory_train  + sigma*randn(M_train,1); % y = f(x)+noise

% test set - for plots only
M_test = 100;   % test dataset size
x_test = linspace(0,0.6,M_test)';  % linearly spaced points
y_theory_test = polyval(p_coeff,x_test);
y_test = y_theory_test  + 0.1*randn(M_test,1);

%% Kernel regression
lambda = 0.01;
c = 1;
N = 5;
K_poly = @(x1, x2) (x1*x2'+c).^N;
b = 0.1;
K_rbf = @(x1, x2) exp(-(x1-x2').^2/2/b);
K_func = K_rbf;
K = K_func(x_train,x_train);
alpha = (K + lambda*eye(M_train))\y_train;
yh = K_func(x_test,x_train)*alpha;

%% Plots
figure(1)
clf
hold on
% Dataset
plot(x_train,y_train,'o',MarkerFaceColor='b')
% Theoretical function y=f(x)
plot(x_test,y_theory_test,LineWidth=1.5)
% Regression 
plot(x_test,yh,'-.',LineWidth=1.25)
% Test dataset
plot(x_test,y_test,'.')
% ylim([-0.1 1.5])
legend('Train', ...
    'Theory, $y=f(x)$', ...
    'Kernel reg', ...
    'Test',Location='best')
xlabel('x')
ylabel('y')

%exportgraphics(gcf,'kernel_regression.pdf')