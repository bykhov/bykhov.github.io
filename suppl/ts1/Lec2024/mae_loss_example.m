clearvars
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
set(groot,'defaultLineLineWidth',1.25)

%% Dataset
M_train = 40;   % train dataset size
sigma = 0.1;    % noise std
x_train = random('Uniform',0,0.6,M_train,1);    % x of the train dataset
p_coeff = [0.1 3 1 0.2 0.01];                   % theoretical polynomial coefficients
y_theory_train = polyval(p_coeff,x_train);      % theoretical function y=f(x)
y_train = y_theory_train  + sigma*randn(M_train,1); % y = f(x)+noise

% add outliers
x_train(M_train+(1:3)) = [0.24 0.25 0.26]';
y_train(M_train+(1:3)) = [1.2 1.2 1.1]';

% test set - for plots only
M_test = 100;   % test dataset size
x_test = linspace(0,0.6,M_test)';  % linearly spaced points
y_theory_test = polyval(p_coeff,x_test);
y_test = y_theory_test  + 0.1*randn(M_test,1);

%% Polynomial model
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
    % Goal: polynomial model regression values for weights w
    M = size(x,1);
    N = length(w)-1;
    X = zeros(M,N+1);
    for k = 0:N
        X(:,k+1) = x.^k;
    end
    yh = X*w;
end

% MSE loss - single lambda example
N = 4;
lambda = 0.01;
% weights learned from train
[~, w_poly_mse] = polynomial_regression_weights(x_train,y_train,N,lambda);
% yh_test
yh_mse = polynomial_regression_values(x_test ,w_poly_mse);
mse = mean((y_test - yh_mse).^2);

% MSE loss - lambda optimization
cnt = 1;
lambda_vals = linspace(0,0.2);
for lambda = lambda_vals
    [~, w_poly_mse] = polynomial_regression_weights(x_train,y_train,N,lambda);
    % yh_test
    yh_mse = polynomial_regression_values(x_test ,w_poly_mse);
    mse(cnt) = mean((y_test - yh_mse).^2);
    cnt = cnt + 1;
end
[~,idx] = min(mse);
lambda_optimal = lambda_vals(idx);
figure(2)
plot(lambda_vals,mse)
xlabel('$\lambda$')
ylabel('MSE')
title('MSE Loss - $\lambda$ dependency')

% MSE loss - optimal lambda results
[~, w_poly_mse] = polynomial_regression_weights(x_train,y_train,N,lambda_optimal);
% yh_test
yh_mse = polynomial_regression_values(x_test ,w_poly_mse);

%% MAE
function loss = mae_loss(y,yh)
    e = abs(y - yh);
    loss = mean(e);
end

% function to optimize
function loss = target_reg(x,y,w,loss_func,lambda)
    % x: 1d-vector, Mx1
    % y: 1d-vector, Mx1
    % w: weights, (N+1)x1, N: order of polynomial
    % delta:    Huber loss parameters
    % loss_func:    Huber,MAE, etc.
    % lambda:   regularization constant
    yh = polynomial_regression_values(x,w);
    loss = loss_func(yh,y) + lambda*mean(w(2:end).^2);
end

% MAE loss - lambda optimization
cnt = 1;
lambda_vals = linspace(0,0.01);
for lambda = lambda_vals
    fun_mae = @(w) target_reg(x_train,y_train,w,@mae_loss,lambda);
    w_poly_mae = fminsearch(fun_mae,w_poly_mse);
    % yh_test
    yh_mae = polynomial_regression_values(x_test ,w_poly_mae);
    mae(cnt) = mean((y_test - yh_mae).^2);
    cnt = cnt + 1;
end
[~,idx] = min(mae);
lambda_optimal = lambda_vals(idx);
figure(3)
plot(lambda_vals,mae)
xlabel('$\lambda$')
ylabel('MAE')
title('MAE Loss - $\lambda$ dependency')

% MAE loss - optimal lambda results
fun_mae = @(w) target_reg(x_train,y_train,w,@mae_loss,lambda_optimal);
w_poly_mae = fminsearch(fun_mae,w_poly_mse,optimset('MaxFunEvals',1e5));
% yh_test
yh_mae = polynomial_regression_values(x_test ,w_poly_mae);

%% Plot
figure(1)
clf
hold on
plot(x_test,y_theory_test,'LineWidth',1.25)
plot(x_train,y_train,'or','MarkerSize',2,'MarkerFaceColor','r')
plot(x_test,y_test,'og','MarkerSize',2,'MarkerFaceColor','g')
plot(x_test,yh_mse,'LineWidth',1.25)
plot(x_test,yh_mae,'LineWidth',1.25)

legend('Theory','Train','Test', ...
    'MSE','MAE',...
    Location='northwest')
xlabel('x')
ylabel('$y=f(x)$')
hold off

%exportgraphics(gcf,'mae_loss_example.pdf')