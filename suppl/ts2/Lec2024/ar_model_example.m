clearvars
close all

set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
set(groot,'defaultAxesFontName','Times New Roman')
set(groot,'defaultAxesFontSize',12)
set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')

rng(3)

%% Dataset
L = 1e3; % signal length
A = [1 1.5 0.75 0.15];
y = filter(1, A ,randn(L,1));

%% Auto-correlation
[R,lags] = xcorr(y,20,'coeff');

figure(1)
subplot(211)
stem(lags, R,'filled',LineWidth=1,MarkerSize=4)
xlabel('k')
title('$R_{\bf xx,norm}[k]$')
grid on

% vcrit = 1.9600;
% lconf = -vcrit/sqrt(L);
% upconf = vcrit/sqrt(L);
% text(-17, 0.5, ['Conf $\pm$' num2str(upconf,3)])

%% Prediction --- Biased ACF ---

[R,lags] = xcorr(y,20,'biased');

% --- p = 1 ---
a1 = R(lags == 1)/R(lags == 0);
yh = filter(a1,1,y);
mse1 = mean((y(2:end)-yh(1:end-1)).^2);
mse1_t = R(lags == 0) - a1*R(lags == 1);
disp(['1 coefficient: mse = ' num2str(mse1) ' theory = ' num2str(mse1_t)])

% --- p = 2 ---
Rx = [R(lags == 0) R(lags == 1); R(lags == 1) R(lags == 0)];
R2 = [R(lags == 1); R(lags == 2)];
a = Rx\R2;
yh = filter(a,1,y);
mse2 = mean((y(2:end)-yh(1:end-1)).^2);
mse2_t = R(lags == 0) - a(1)*R(lags == 1) - a(2)*R(lags == 2);
disp(['2 coefficient: mse = ' num2str(mse2) ' theory = ' num2str(mse2_t)])

% --- p = 3 ---
Rx = [  R(lags == 0) R(lags == 1) R(lags == 2); ...
        R(lags == 1) R(lags == 0) R(lags == 1); ...
        R(lags == 2) R(lags == 1) R(lags == 0)];
R2 = [R(lags == 1); R(lags == 2); R(lags == 3)];
a = Rx\R2
yh = filter(a',1,y);
mse3 = mean((y(2:end)-yh(1:end-1)).^2);
mse3_t = R(lags == 0) - a(1)*R(lags == 1) - a(2)*R(lags == 2) - a(3)*R(lags == 3);
disp(['3 coefficient: mse = ' num2str(mse3) ' theory = ' num2str(mse3_t)])

%% Matrix formulation
p = 3;
X = zeros(L-1,p);
for m = 1:p
    X(:,m) = [zeros(m-1,1); y(1:end-m)];
end
a_m = lsqminnorm(X,y(2:end))
% note a small difference between ACF-based calculation and exact
% matrix-based calculation

%% Prediction --- LPC command ---
% p = 3
[a_lpc,E3] = lpc(y,3);
yh = filter([-a_lpc(2:end)],1,y);
mse3b = mean((y(2:end)-yh(1:end-1)).^2);
disp(['3 coefficient: mse = ' num2str(mse3b) ' theory = ' num2str(E3) ' (lpc command)'])

%% Coefficient number dependency
subplot(212)
for k = 1:7
    [~,mse_E(k)] = lpc(y,k);
end
plot(mse_E,Marker='o',MarkerSize=4,MarkerFaceColor='b')
xlabel('Number of coefficients, $p$')
ylabel('MSE')

%% AR command (Econometrics Toolbox)
% p = 3
sys = ar(y,3);
disp(['3 coefficient: mse = ' num2str(sys.NoiseVariance) ' theory = ' num2str(E3) ' (ar command)'])
-sys.A(2:end)
% Note, more close to matrix-based calculation

%% 
figure(2)
compare(y, ar(y,3), 1)