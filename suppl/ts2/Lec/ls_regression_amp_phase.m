clearvars
close all

rng(253)

%% dataset
w0 = 0.1*pi;
A = 1.5;
theta = -pi/4;
L = 100;
n = (0:L-1)';
sigma = 1;

y_theory = A*cos(w0*n+theta);
y = y_theory + sigma*randn(L,1);

%% LS
X = [cos(w0*n) sin(w0*n)];
w_ls = pinv(X)*y;
y_hat = X*w_ls;

w_theory = [A*cos(theta); -A*sin(theta)]
%% Amplitude and phase
A_hat = sqrt(sum(w_ls.^2));
theta_hat = -atan2(w_ls(2),w_ls(1));

%% Plot
figure(1)
clf
hold on
plot(n,y,'.-')
plot(n,y_theory,n,y_hat,LineWidth=1)
hold off
grid on
legend('Dataset',['Theory A=' num2str(A) ', theta=' num2str(theta/pi) '$\pi$'], ...
    ['LS A=' num2str(A_hat,3) ', theta=' num2str(theta_hat/pi,3) '$\pi$'], ...
    Location='best',Interpreter='latex')
set(gca,'FontName','Times New Roman','FontSize',12)

exportgraphics(gcf,'ls_regression_amp_phase.pdf')


%%
A - A_hat
theta - theta_hat

%% Goertzel - note the frequency number
[abs(goertzel(y,w0/2/pi*L+1))/L*2; A_hat]
[angle(goertzel(y,w0/2/pi*L+1)); theta_hat]