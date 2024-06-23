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

L = 1e3;
x = randn(L,1);
a = [1 0.2 0.06 -0.27];
bias = 2;
y = filter(1, a ,x) + bias;

%% Prediction --- Biased ACF ---

p = 3;
X = zeros(L-1,p+1);
X(:,1) = ones(L-1,1);
for m = 1:p
    X(:,m+1) = [zeros(m-1,1); y(1:end-m)];
end
a_m = lsqminnorm(X,y(2:end));

% remove bias
a_lpc = lpc(y-bias,3);

% Same coefficients but with bias
[a_m [NaN;-a_lpc(2:end)'] [bias;-a(2:end)']]
