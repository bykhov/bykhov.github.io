N = 1e5;    % Signal length
sigma = 1;  % Noise variance
w = sigma*randn(1,N);   % Noise realization
y = filter([1/2 1/2],1,w);  % Filtered noise
figure(1)
[c, lg] = xcorr(y,5,'biased');    % Auto-covariance C_x[k], for |k| <= 5
stem(lg,c)

% Plot configuration
xlabel('k',Interpreter='latex')
title('$R_X[k]$',Interpreter='latex')
set(gca,'YTick',[0 sigma^2/4 sigma^2/2])
%ylim([-0.5 sigma^2/2*1.2])
grid on
set(findobj(fig,'-property','FontName'), ...
    'FontName','Times New Roman','FontSize',  13)

%%
figure(2)
nexttile
plot(w(1:100),'LineWidth',1)
title('Noise')
grid on
nexttile
plot(x(1:100),'LineWidth',1)
title('Signal')
grid on
set(findobj(fig,'-property','FontName'), ...
    'FontName','Times New Roman','FontSize',  13)