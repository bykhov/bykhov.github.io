clear all
close all
rng(13) % initialization of random generator for a repeatability

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

%% LS
function [yh, w] = polynomial_regression_weights(x,y,N,lambda)
    % Goal: find polynomial regression values
    % Inputs:
    %   x,y   : dataset
    %   N     : order of a polynomial
    %   lambda: regularization constant
    % Outputs:
    %   w   : optimal weights
    %   yh  : predicted y values based on w

    M = size(x,1);  % dataset size
    X = zeros(M,N+1);
    for k = 0:N
        X(:,k+1) = x.^k;  % each column is a different power of x
    end
    if (nargin == 3) or (lambda == 0)
        w = lsqminnorm(X,y);
    else % regularization change
        g = lambda*eye(N+1);
        g(1) = 0;   % no penalty on w0 (bias)
        w = (X'*X + g)\(X'*y);
    end
    yh = X*w;
end


function yh = polynomial_regression_values(x,w)
    % Goal: values of a polynomial regression of given weights
    % Note: lambda independent
    % Inputs:
    %   x: data
    %   w: weights
    % Outputs:    
    %   yh  : predicted y values based on x and w
    M = size(x,1); % dataset size
    N = length(w)-1; % order of polynomial
    X = zeros(M,N+1);
    for k = 0:N
        X(:,k+1) = x.^k;
    end
    yh = X*w;
end

%% Model evaluation
lambda = 0.01;
N_high = 9;

% No regularization, high N
[~, w] = polynomial_regression_weights(x_train,y_train,N_high,0);
% For plot purposes only
yh = polynomial_regression_values(x_test,w);
MSE_highN = norm(y_test - yh)^2/M_test
% other ways to implement
% MSE_highN = sum((y_test - yh).^2)/M_test
% MSE_highN = mean((y_test - yh).^2)

N_small = 3;
% No regularization, small N
[~, w3] = polynomial_regression_weights(x_train,y_train,N_small,0);
% For plot purposes only
yh_small = polynomial_regression_values(x_test,w3);
MSE_smallN = norm(y_test - yh_small)^2/M_test

% With regularization
[~, w_r] = polynomial_regression_weights(x_train,y_train,N_high,lambda);
% For plot purposes only
yh_r = polynomial_regression_values(x_test,w_r);
MSE_highN_reg = norm(y_test - yh_r)^2/M_test

%% MSE

%% Plots
figure(1)
clf
hold on
% Dataset
plot(x_train,y_train,'o',MarkerFaceColor='b')
% Theoretical function y=f(x)
plot(x_test,y_theory_test,LineWidth=1.5)
% Regression without regularization, high N
plot(x_test,yh,'-.',LineWidth=1)
% Regression without regularization, smaller N
plot(x_test,yh_small,'-.',LineWidth=1)
% Regression with regularization
plot(x_test,yh_r,LineWidth=1)
% Test dataset
plot(x_test,y_test,'.')
ylim([-0.1 1.5])
legend('Train', 'Theory, $y=f(x)$', ...
    ['Fit$\quad\quad\quad\quad$ ($N=' num2str(N_high) '$), $w_{max}=' num2str(max(w),3) '$'], ...
    ['Fit$\quad\quad\quad\quad$ ($N=' num2str(N_small) '$), $w_{max}=' num2str(max(w3),3) '$'], ...
    ['Regularized ($N=' num2str(N_high) '$), $w_{max}=' num2str(max(w_r),3) '$',], ...
    'Test',Location='best')
xlabel('x')
ylabel('y')
title('$y=\sum_{n=0}^N w_nx^n$')

%%
%exportgraphics(gcf,'linear_fit_poly_reg.pdf')
