clearvars
mu1 = 0;
mu2 = 0;
sigma1 = 1;
sigma2 = 2;
rho = 0.5;
mu = [mu1; mu2];
Cv = [sigma1^2 rho*sigma1*sigma2; ...
    rho*sigma1*sigma2 sigma2^2];

a = 0;
b = 0;
% F(a,b)
mvncdf([a; b],mu, Cv) % mvn = multivariate normal
%X = mvnrnd(mu, Cv,1e6);
%histogram2(X(:,1),X(:,2))

%%
% mu = [0; 1];
% Cv = [7 3; 3 5];
% mvncdf([3; 3],mu, Cv) % mvn = multivariate normal