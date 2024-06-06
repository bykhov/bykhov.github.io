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

N = L+50;  % number of frequencies 

%% LS
X = zeros(L,2*N-1);
X(:,1) = ones(L,1);
X(:,2:2:end) = cos(2*pi/N*n*(1:N-1));
X(:,3:2:end) = sin(2*pi/N*n*(1:N-1));

w_ls = lsqminnorm(X,y); %w_ls = pinv(X)*y;
y_hat = X*w_ls;

%% Amplitude and phase
A_hat(1) = w_ls(1);
A_hat(2:N) = sqrt(w_ls(2:2:end).^2 + w_ls(3:2:end).^2);
theta_hat(1) = 0;
theta_hat(2:N) = -atan2(w_ls(3:2:end),w_ls(2:2:end));

Y = fft(y,N);
%% Plot
% figure(1)
% plot(n,y_hat-y)
% title('Full reconstraction')
% grid on

figure(2)
subplot(211)
plot(0:N-1,A_hat,0:N-1,abs(Y)/N)
grid on
xlim([0 N-1])
ylabel('$A_k$',Interpreter='latex')
legend('LS','FFT')
set(gca,'FontName','Times New Roman','FontSize',12)

subplot(212)
plot(0:N-1,theta_hat,0:N-1,angle(Y))
grid on
ylabel('$\theta_k$',Interpreter='latex')
%plot(n,y_theory,n,y_hat,LineWidth=1)
%hold off
xlim([0 N-1])
xlabel('k')
set(gca,'FontName','Times New Roman','FontSize',12)


