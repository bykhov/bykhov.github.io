clearvars
close all

rng(234)
M_train = 100;
sigma = 0.1;
x_train = random('Uniform',0,0.6,M_train,1);
p_coeff = [0.1 3 1 0.2 0.01];
y_theory_train = polyval(p_coeff,x_train);
y_train = y_theory_train  + sigma*randn(M_train,1); 

M_test = 100;
x_test = random('Uniform',0,0.6,M_test,1);
y_theory_test = polyval(p_coeff,x_test);
y_test = y_theory_test  + 0.1*randn(M_test,1);

%%
function [yh, w] = polynomial_regression_weights(x,y,N)
    M = size(x,1);
    X = zeros(M,N+1);
    for k = 0:N
        X(:,k+1) = x.^k;
    end
    w = pinv(X)*y;
    yh = X*w;
end

function yh = polynomial_regression_values(x,w)
    M = size(x,1);
    N = length(w)-1;
    X = zeros(M,N+1);
    for k = 0:N
        X(:,k+1) = x.^k;
    end
    yh = X*w;
end

%%
N = 6;
% Learning weights
[~, w] = polynomial_regression_weights(x_train,y_train,N);

% Test performance
yh_test = polynomial_regression_values(x_test ,w);
mse_N = norm(yh_test - y_test)^2/M_test;

% For plots only
x_theory = (0:.001:0.6)';
yh = polynomial_regression_values(x_theory ,w);

figure(1)
plot(x_train,y_train,'o','MarkerSize',5,'MarkerFaceColor','r')
hold on
plot(x_test,y_test,'o','MarkerSize',2)
plot(x_theory,yh,'-','LineWidth',1.25,'Color','k')
hold off
ylim([0 2])
title(['N=' num2str(N) ', mse=' num2str(mse_N,5)],'Interpreter','latex')
grid on
