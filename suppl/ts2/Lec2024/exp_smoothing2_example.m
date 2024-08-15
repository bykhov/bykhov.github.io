clearvars  
load iddata9
y =  z9.OutputData; clear z9
y = y(1:150);
set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultAxesFontName','Times New Roman')
set(groot,'defaultAxesFontSize',12)
set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')

% y = [30,21,29,31,40,48,53,47,37,39,31,29,17,9,20,24,27,35,41,38,...
%          27,31,27,26,21,13,21,18,33,35,40,36,22,24,21,20,17,14,17,19,...
%          26,29,40,31,20,24,18,26,17,9,17,21,28,32,46,33,23,28,22,27,...
%          18,8,17,21,31,34,44,38,31,30,26,32]'; 

%y = [0.9, 0.8, 0.7, 0.6];
%%

function [loss, yh, e] = exp_smothing2(y,params)
    % Double exponential smoothing
    % Inputs:
    %   y:          input signal
    %   params(1):  alpha
    %   params(2):  beta
    % Outputs:
    %   loss:   MSE loss
    %   yh:     prediction          for n=3:length(y)
    %   e:      prediction error    for n=3:length(y)
    alpha = params(1);
    beta = params(2);
    L = length(y);
    yh = zeros(L,1);

    yh(1) = y(1);
    l(1) = y(1);
    b(1) = y(2) - y(1);
    for n = 2:length(y)-1
        l(n) = alpha*y(n) + (1-alpha)*(l(n-1) + b(n-1));
        b(n) = beta*(l(n)-l(n-1)) + (1-beta)*b(n-1);      
        yh(n+1) = l(n)+b(n);
    end
    e = yh(3:end) -y(3:end);
    loss = mean(e.^2);
end

alpha = 0.5;
beta = 0.5;
[loss, yh, e] = exp_smothing2(y,[alpha,beta]);

%%
minFunc = @(x) exp_smothing2(y,x);
%[a_opt, loss_min] = fminbnd(minFunc,0,1);
[param_opt, loss_min] = fminsearch(minFunc,[0.1, 0.1]);
[loss, yh, e] = exp_smothing2(y,param_opt);
%%
L = length(y);
n = 0:L-1;

figure(1)
subplot(211)
plot(n,y,n,yh)
subplot(212)
plot(n(3:end),e)
title(['$\alpha_{opt} = ' num2str(param_opt(1)) ...
    ', \beta_{opt} = ' num2str(param_opt(2)) ...
    ', \mathcal{L} = ' num2str(loss,3) ' $'])