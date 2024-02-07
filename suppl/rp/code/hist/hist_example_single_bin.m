N = 1e7; % number of experiments
X = exprnd(1, 1, N); % experiment results - N exponentially distributed

% [min(X),max(X)] - תחום תוצאות הניסוי
m = 50; % number of bins
dx = (max(X)-min(X))/m;
a = min(X);
b = min(X)+ dx;
x0 = (b-a)/2;
f = (sum((a < X) & (X < b))/N)/dx % the value of f_X(x0 = dx/2)
theory = exppdf(x0,1)

%%
histogram(X,10,'Normalization','pdf')