N = 1e6;
sigma = 2;
x = sigma*randn(1,1e6);         % Rx[k] = sigma^2*delta[k]
y = [zeros(1,50) x(1:end-50)];  % y[n] = x[n-50]
[C1, lags] = xcov(y,x,200,'biased');

y2 = [x(51:end) zeros(1,50)];   % y[n] = x[n+50]
C2 = xcov(y2,x,200,'biased');

figure(1)
subplot(211)
plot(lags,C1)
xlabel('k',Interpreter='latex')
title('$C_X[k]$',Interpreter='latex')
grid on

subplot(212)
plot(lags,C2)
xlabel('k',Interpreter='latex')
title('$C_X[k]$',Interpreter='latex')
grid on