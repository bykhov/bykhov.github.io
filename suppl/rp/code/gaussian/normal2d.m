close all
clearvars

mu = [0 0];
Cx = [2 0.75; 0.75 1];
N = 1e4;

%% Linear Prediction
E1 = mu(1);
E2 = mu(2);
C12 = Cx(2,1);
V1 = Cx(1,1);
V2 = Cx(2,2);
rho = C12/sqrt(V1*V2)

X = mvnrnd(mu,Cx,N);

% E1 = mean(X(:,1));
% E2 = mean(X(:,2));
% C12 = mean(X(:,1).*X(:,2)) - E1*E2;
% V1 = var(X(:,1));

Yh = E2+C12/V1*(X(:,1)-E1);

figure(1)
plot(X(:,1),X(:,2),'.')
hold on
plot(X(:,1),Yh,'LineWidth',1.5)
axis('equal')
grid on
set(gcf, 'Color', 'w');
xlabel('$X$','Interpreter','Latex');
ylabel('$Y$','Interpreter','Latex');

%
e = X(:,2)-Yh;
E_sim = mean(e.^2)
E_theory = (1-rho^2)*V2
%% PDF
x1 = -3:.2:3; x2 = -3:.2:3;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Cx);
F = reshape(F,length(x2),length(x1));

figure(2)
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -3 3 0 .25])
xlabel('$x_1$','Interpreter','Latex');
ylabel('$x_2$','Interpreter','Latex');
zlabel('$f_{\bf X}({\bf x})$','Interpreter','Latex');

figure(4)
contour(x1,x2,F,8);
axis image
xlabel('$x_1$','Interpreter','Latex');
ylabel('$x_2$','Interpreter','Latex');
grid on
title('Gaussian PDF 2D')
set(gcf, 'Color', 'w');

%%
figure(3)
histogram2(X(:,1),X(:,2),'Normalization','pdf')
xlabel('$X$','Interpreter','Latex');
ylabel('$Y$','Interpreter','Latex');
set(gcf, 'Color', 'w');
