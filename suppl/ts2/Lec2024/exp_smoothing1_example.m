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

figure
plot(y)

% y = [30,21,29,31,40,48,53,47,37,39,31,29,17,9,20,24,27,35,41,38,...
%          27,31,27,26,21,13,21,18,33,35,40,36,22,24,21,20,17,14,17,19,...
%          26,29,40,31,20,24,18,26,17,9,17,21,28,32,46,33,23,28,22,27,...
%          18,8,17,21,31,34,44,38,31,30,26,32]'; 

%%
a = 0.9;

function [loss, yh, e] = exp_smothing1(y,a)
    % Simple exponential smoothing
    % Inputs:
    %   y: input signal
    %   a: alpha
    % Outputs:
    %   loss:   MSE loss
    %   yh:     prediction          for n=3:length(y)
    %   e:      prediction error    for n=3:length(y)
    L = length(y);
    yh = zeros(L,1);
    yh(1) = y(1);
    yh(2) = y(2);
    for k = 2:length(y)-1
        yh(k+1) = a*y(k) + (1-a)*y(k-1);
    end
    e = yh(3:end) -y(3:end);
    loss = mean(e.^2);
end

minFunc = @(a) exp_smothing1(y,a);
[a_opt, loss_min] = fminsearch(minFunc,0.1,optimset('Display','notify'));
[loss, yh, e] = exp_smothing1(y,a_opt);
%%
L = length(y);
n = 0:L-1;

figure(1)
subplot(211)
plot(n,y,n,yh)
subplot(212)
plot(n(3:end),e)
title(['$a_{opt} = ' num2str(a_opt) ', \mathcal{L} = ' num2str(loss,3) ' $'])