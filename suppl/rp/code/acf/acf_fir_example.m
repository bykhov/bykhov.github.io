N = 1e5;    % Signal length
sigma = 1;  % Noise variance
w = sigma*randn(1,N);   % Noise realization
y = filter([1/2 1/2],1,w);  % Filtered noise
[c, lg] = xcorr(y,5,'biased');    % Auto-covariance C_x[k], for |k| <= 5
stem(lg,c)

% Plot configuration
xlabel('k',Interpreter='latex')
title('$R_X[k]$',Interpreter='latex')
set(gca,'YTick',[0 sigma^2/4 sigma^2/2])
%ylim([-0.5 sigma^2/2*1.2])
grid on