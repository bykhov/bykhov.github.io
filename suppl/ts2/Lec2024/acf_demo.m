clearvars
close all
% rng("default")

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultAxesFontName','Times New Roman')
set(groot,'defaultAxesFontSize',12)
set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')

%% Signal generation
L = 1000;
x = randn(L,1);
x = filter(1,[1 -0.95],x);

%% ACF
figure(1);
subplot(211)
plot(0:L-1,x, LineWidth=1)
xlabel('n')
ylabel('x[n]')
grid on

[R,lags] = xcorr(x,50,'coeff');
subplot(212)
plot(lags(51:end),R(51:end),LineWidth=1)
ylabel('$R_{\mathbf{xx}}[k]$')
xlabel('$k$')
grid on

figure(2);
subplot(1,2,1)
plot(x(1:end-1),x(2:end),'.')
xlabel('$x[n]$')
ylabel('$x[n-1]$')
R = xcorr(x,1,'coeff');
title(['$R_{\mathbf{xx}}[1]=' num2str(R(end)) '$'],Interpreter="latex")
grid on
axis tight
axis equal

subplot(122)
k = 20;
plot(x(1:end-k),x(k+1:end),'.')
xlabel('$x[n]$',Interpreter='latex')
ylabel(['$x[n-' num2str(k) ']$'])
R = xcorr(x,k,'coeff');
title(['$R_{\mathbf{xx}}[' num2str(k) ']=' num2str(R(end)) '$'])
grid on
axis tight
axis equal

%% Vector formulas
k =5 ;
X = x(1:end-k);
y = x(k+1:end);
a_k = lsqminnorm(X,y);
y_hat = X*a_k;

[R,~] = xcorr(y,k,'coeff');
Rxx_k = R(end);
Rxx_k_unbiased = Rxx_k*L/(L-k);

e = y_hat - y;
mse_sim = e'*e; % numerical error
 
figure(3);
subplot(211)
plot(y,LineWidth=1)
hold on
plot(y_hat,LineWidth=1)
hold off
title(['$R_{xx,norm}[' num2str(k) ']=' num2str(Rxx_k,5) ', R_{xx,unbiased}[' num2str(k) ']=' num2str(Rxx_k_unbiased,5) ...
    ', a_' num2str(k) '=' num2str(a_k,5) '$'])
xlim([0 200])

subplot(212)
plot(e,LineWidth=1)
xlim([0 200])
ylim([-4 4])