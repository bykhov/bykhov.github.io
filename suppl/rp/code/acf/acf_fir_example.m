close all
clear all

N = 1e5;    % Signal length
sigma = 1;  % Noise variance
w = sigma*randn(1,N);   % Noise realization
y = filter([1/2 1/2],1,w);  % Filtered noise
fig1 = figure(1);
[c, lg] = xcorr(y,5,'biased');    % Auto-covariance C_x[k], for |k| <= 5
stem(lg,c)

% Plot configuration
xlabel('k',Interpreter='latex')
title('$R_X[k]$',Interpreter='latex')
set(gca,'YTick',[0 sigma^2/4 sigma^2/2])
%ylim([-0.5 sigma^2/2*1.2])
grid on
set(findobj(fig1,'-property','FontName'), ...
    'FontName','Times New Roman','FontSize',  13)

%%
fig2 = figure(2);
nexttile
plot(w(1:100),'LineWidth',1)
title('Noise')
xlabel('Time')
grid on
ylim([-2,2])
nexttile
plot(y(1:100),'LineWidth',1)
xlabel('Time')
title('Signal')
grid on
ylim([-2,2])
set(findobj(fig2,'-property','FontName'), ...
    'FontName','Times New Roman','FontSize',  13)

%%
fig3 = figure(3);
z = filter([1/4 1/4 1/4 1/4],1,w);  % Filtered noise
plot(z(1:100),'LineWidth',1)
ylim([-2,2])
grid on
xlabel('Time')
title('h=[1/4 1/4 1/4 1/4]')