clearvars
N = 1e6;
X = randn(1,N);
W = randi([0 1],1,N);
W(W == 0) = -1;
Y = W.*X;
Z = X+Y;

figure(1)
nexttile
histogram(X,'Normalization','pdf')
title('X')
nexttile
histogram(W,'Normalization','pdf')
title('W')
nexttile
histogram(Y,'Normalization','pdf')
title('Y')
nexttile
histogram(Z,'Normalization','pdf')
title('$Z ?\sim N(\cdot)$','Interpreter','latex')