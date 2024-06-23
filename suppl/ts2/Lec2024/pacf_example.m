clearvars
close all

% https://www.mathworks.com/help/signal/ug/ar-order-selection-with-partial-autocorrelation-sequence.html
rng(3)

L = 1e3;
A = [1 1.5 0.75];
x = filter(1, A ,randn(L,1));

%% PACF - Built-in command - Signal Processing Toolbox
k_max = 15;
[arcoefs,E,K] = aryule(x,k_max); % Yule-Walker algorithm
pacf_m = -K;

[Rx, lags] = xcorr(x,k_max,'normalized');

conf = sqrt(2)*erfinv(0.95)/sqrt(L);

figure(1)
subplot(211)
stem(0:k_max,Rx(k_max+1:end),'filled')
yline(conf,'--r')
yline(-conf,'--r')
ylabel('ACF')

subplot(212)
stem(1:k_max,pacf_m,'filled')
yline(conf,'--r')
yline(-conf,'--r')
xlabel('Lag')
ylabel('Partial ACF')

%% PACF - Built-in command - Econometrics Toolbox
figure(4)
subplot(211)
autocorr(x)
subplot(212)
parcorr(x)

%% phi_j,j - By definition
pacf = zeros(k_max,1);
R = xcorr(x,1,'coeff');
pacf(1) = R(end);
for i=2:length(pacf)
    a_lpc = lpc(x,i);
    pacf(i) = -a_lpc(end);
end
