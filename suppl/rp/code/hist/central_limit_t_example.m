clearvars;

n = 50; % number of variables
N = 1e6; % number of experiments
X = (randi(2,[n N])-1.5)*2;

% X = exprnd(1, n, N); % experiment results

Y = sum(X,1);
histogram(Y,'Normalization','pdf')
grid on
title(['Mean = ' num2str(mean(Y)) ', Var = ' num2str(var(Y))])