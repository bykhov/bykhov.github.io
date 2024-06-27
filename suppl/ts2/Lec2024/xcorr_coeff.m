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

%%
L = 1000;
z = randn(L,1);
z1 = filter(1,[1 -0.95],z);
z2 = filter(1,[1 -0.9],z);

x = z1;
y = z2;
a1 = lsqminnorm(x,y);
y_hat = x*a1;

rho = x'*y/sqrt((x'*x)*(y'*y));

%%
n = 0:L-1;

n0 = 50;
[Rxy,~] = xcorr(x,y,n0);
[Rxy_norm,lags] = xcorr(x,y,n0,"normalized");

f1 = figure(1);
subplot(2,1,1)
plot(n,x,n,y,LineWidth=1)
xlabel('n')
legend('x[n]','y[n]',Location='best')

subplot(212)
plot(lags(n0+1:end),Rxy(n0+1:end),LineWidth=1)
xlabel('k')
legend('$R_{xy}[k]$')


f3 = figure(3);
subplot(121)
plot(x,y,'.')
xlabel('x[n]')
ylabel('y[n]')
axis tight
axis equal
title(['$R_{xy,norm}[0]=' num2str(Rxy_norm(lags == 0),3) '$'])
%axis square

subplot(122)
k = 3;
plot(x(1:end-4),y(5:end),'.')
xlabel(['x[n-' num2str(k) ']'])
ylabel('y[n]')
axis tight
axis square
axis equal
title(['$R_{xy,norm}[' num2str(k) ']=' num2str(Rxy_norm(lags == k),3) '$'])

%%
exportgraphics(f1,'xcorr_example.pdf')
exportgraphics(f3,'xcorr_corr_coeff.pdf')