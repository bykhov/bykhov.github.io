clearvars  
load iddata9
data =  z9.OutputData; clear z9

%% MA only model
% define model
q = 20;
sys = arima(0,0,q);
% learn model parameters
idx = 95;
train_data = data(1:idx);
test_data = data(idx:end);

Md1 = estimate(sys,train_data);

yf = forecast(Md1,50,'Y0',test_data);

% Plot MA
figure('Name','MA only model')
plot(1:length(data),data,'b', ...
    idx+1:idx+length(yf), yf, '.-r')
legend('Signal','Forecast')
grid on

%% AR model
% define model
p = 6;
q = 0;
sys = arima(p,0,q);
% learn model parameters
idx = 80;
train_data = data(1:idx);
test_data = data(idx:end);

Md1 = estimate(sys,train_data);

yf = forecast(Md1,400,'Y0',train_data);
figure('Name','AR model')
plot(1:length(data),data,'b', ...
    idx:idx+length(yf), [train_data(end);yf], 'r')
legend('Signal','Forecast')
grid on

%% ARMA model
% define model
p = 3;
q = 3;
sys = arima(p,0,q);
% learn model parameters
idx = 80;
train_data = data(1:idx);
test_data = data(idx:end);

Md1 = estimate(sys,train_data);

yf = forecast(Md1,400,'Y0',train_data);
figure('Name','ARMA model')
plot(1:length(data),data,'b', ...
    idx:idx+length(yf), [train_data(end);yf], 'r')
legend('Signal','Forecast')
grid on


%% ARIMA model
% define model
p = 3;
q = 3;
d = 1; % linear trend
d = 2; % quadratic trend
sys = arima(p,d,q);
% learn model parameters
idx = 80;
train_data = data(1:idx);
test_data = data(idx:end);

Md1 = estimate(sys,train_data);

yf = forecast(Md1,70,'Y0',train_data);
figure('Name','ARIMA model')
plot(1:length(data),data,'b', ...
    idx:idx+length(yf), [train_data(end);yf], 'r')
legend('Signal','Forecast')
grid on