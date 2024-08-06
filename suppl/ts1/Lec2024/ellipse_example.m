clearvars

A = [2 1; 1 1.5];
[V, D] = eig(A);
v1 = V(:,1);
v2 = V(:,2);
f1= @(x,y) [x, y]*A*[x, y]'-3;
f2= @(x,y) [x, y]*D*[x, y]'-3;


figure(1)
clf
fimplicit(f1,LineWidth=1.25)
hold on
fimplicit(f2,LineWidth=1.25)
grid on
% line([-2 2],[2 -2],'LineStyle','--')
% line([-2 2],[-2 2],'LineStyle','--')
plot([0 v1(1)*sqrt(6)],[0 v1(2)*sqrt(6)],'--',LineWidth=1.25)
plot([0 v2(1)*sqrt(6)],[0 v2(2)*sqrt(6)],'--',LineWidth=1.25)
legend('Original','Rotated')
% 
%%
%exportgraphics(gcf,'ellipse_pca.pdf')