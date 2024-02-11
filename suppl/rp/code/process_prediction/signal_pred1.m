clearvars

rng(2)

N = 1e5;

x = randn(1,N);
y = filter(randn(1,10),1 ,x);
[R,lags] = xcorr(y,20);
R = R/N;

%% Auto-correlation
stem(lags, R)
xlabel('k')
ylabel('R_{\bf x}[k]')
grid on
set(gcf, 'Color', 'w');
set(gca,'FontSize',13)

%% Prediction 1
a1 = R(lags == 1)/R(lags == 0);
yh = filter(a1,1,y);
mse1 = mean((y(2:end)-yh(1:end-1)).^2);
mse1_t = R(lags == 0) - a1*R(lags == 1);
disp(['1 coefficient: mse = ' num2str(mse1) ' theory = ' num2str(mse1_t)])
%% Prediction 2
Rx = [R(lags == 0) R(lags == 1); R(lags == 1) R(lags == 0)];
R2 = [R(lags == 1); R(lags == 2)];
a = Rx\R2;
yh = filter(a,1,y);
mse2 = mean((y(2:end)-yh(1:end-1)).^2);
mse2_t = R(lags == 0) - a(1)*R(lags == 1) - a(2)*R(lags == 2);
disp(['2 coefficient: mse = ' num2str(mse2) ' theory = ' num2str(mse2_t)])

%% Prediction 3
Rx = [  R(lags == 0) R(lags == 1) R(lags == 2); ...
        R(lags == 1) R(lags == 0) R(lags == 1); ...
        R(lags == 2) R(lags == 1) R(lags == 0)];
R2 = [R(lags == 1); R(lags == 2); R(lags == 3)];
a = Rx\R2;
yh = filter(a',1,y);
mse3 = mean((y(2:end)-yh(1:end-1)).^2);
mse3_t = R(lags == 0) - a(1)*R(lags == 1) - a(2)*R(lags == 2) - a(3)*R(lags == 3);
disp(['3 coefficient: mse = ' num2str(mse3) ' theory = ' num2str(mse3_t)])

%%  Prediction 3b
[a_lpc,E3] = lpc(y,4);
yh = filter([-a_lpc(2:end)],1,y);
mse3b = mean((y(2:end)-yh(1:end-1)).^2);
disp(['3 coefficient: mse = ' num2str(mse3b) ' theory = ' num2str(E3) ' (lpc command)'])

%%  Prediction 10
[a_lpc,E10] = lpc(y,10);
yh = filter([-a_lpc(2:end)],1,y);
mse10b = mean((y(2:end)-yh(1:end-1)).^2);
disp(['10 coefficient: mse = ' num2str(mse10b) ' theory = ' num2str(E10) ' (lpc command)'])

%%  Prediction 50
[a_lpc,E50] = lpc(y,50);
yh = filter([-a_lpc(2:end)],1,y);
mse50b = mean((y(2:end)-yh(1:end-1)).^2);
disp(['50 coefficient: mse = ' num2str(mse50b) ' theory = ' num2str(E50) ' (lpc command)'])

%% Coefficient number dependency
for k = 1:30
    [~,mse_E(k)] = lpc(y,k);
end
figure(2)
plot(mse_E,'-o')
grid on
xlabel('number of coefficients')
ylabel('prediction error (mse)')