clearvars
close all

%rng(253)

%% dataset
w0 = 0.1*pi;
A = 1.5;
theta = -pi/4;
L = 100;
n = (0:L-1)';
sigma = 1;

y_theory = A*cos(w0*n+theta);
noise = sigma*randn(L,1);
y = y_theory + noise;
snr_theory = y_theory'*y_theory/(noise'*noise);

%% LS
function P = per(y,w0)
    L = length(y);
    n = (0:L-1)';
    X = [cos(w0*n) sin(w0*n)];
    w_ls = lsqminnorm(X,y);
    y_hat = X*w_ls;
    P = y_hat'*y_hat;
end

fun = @(w) -per(y,w);
w_max = fminsearch(fun,0.1*pi);

%% SNR 
P_signal_hat = per(y,w_max);
P_noise_hat = y'*y-per(y,w_max);
snr_hat = P_signal_hat/P_noise_hat;
sigma_hat = sqrt(P_noise_hat/L);

%% Plot
w0_values = linspace(0.05*pi,0.15*pi,1000);
cnt = 1;
for w = w0_values
    Py(cnt) = per(y,w);
    cnt = cnt + 1;
end

figure(3)
plot(w0_values/pi,Py)
xline(w_max/pi)

grid on
legend('$||\hat{\mathbf{y}}||^2$', ...
    '$\hat{\omega}_0$', ...
    Location='best',Interpreter='latex')
xlabel('$\omega/\pi$',Interpreter='latex')

set(gca,'FontName','Times New Roman','FontSize',12)

