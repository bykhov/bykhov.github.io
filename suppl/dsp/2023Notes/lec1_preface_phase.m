close all

%%

n = 0:1e4;
x1 = cos(0.01*pi*n);
x2 = cos(0.02*pi*n);
x3 = cos(0.04*pi*n);

figure(10)
subplot(211)
plot(n-200,x1)
xlim([0 400])
ylabel('Input')
title('Frequency 1')
subplot(212)
plot(n(100:500)-100,x1(101:501))
xlim([0 400])
ylabel('Output')
xlabel('time [samples]')

figure(11)
subplot(211)
plot(n-200,x2)
xlim([0 400])
ylabel('Input')
title('Frequency 2')
subplot(212)
plot(n(100:500)-100,x2(110:510))
xlim([0 400])
ylabel('Output')
xlabel('time [samples]')

figure(12)
subplot(211)
plot(n-200,x3)
xlim([0 400])
ylabel('Input')
title('Frequency 3')
subplot(212)
plot(n(100:500)-100,x3(130:530))
xlim([0 400])
ylabel('Output')
xlabel('time [samples]')

%%
figure(1)
h1= plot(n-200,[x1;x2;x3],'LineWidth',1.25);
xlim([0 200])
grid on
set(gca,'FontName','Times New Roman','FontSize',16)
set(gcf, 'Color', 'w');
h1(1).Color = [0 0 0];
h1(2).Color = [0 0 0];
h1(2).LineStyle = '--';
h1(3).Color = [0 0 0];
h1(3).LineStyle = '-.';
lgd = legend('\omega_1','\omega_2','\omega_3');
ylabel('Amplitude')
xlabel('Time [n]')
lgd.FontSize = 16;

% Create ellipse
annotation(gcf,'ellipse',...
    [0.454271028037384 0.864864864864865 0.131398753894081 0.0977130977130982],...
    'LineWidth',2,...
    'LineStyle',':');

text(117,1.07,'Synchronized','FontName','Times New Roman','FontSize',16)

%%

figure(2)
h2= plot(n(100:300)-100,[x1(101:301);x2(105:305);x3(110:310)],'LineWidth',1.25);
xlim([0 200])
grid on
set(gca,'FontName','Times New Roman','FontSize',16)
set(gcf, 'Color', 'w');
h2(1).Color = [0 0 0];
h2(2).Color = [0 0 0];
h2(2).LineStyle = '--';
h2(3).Color = [0 0 0];
h2(3).LineStyle = '-.';
lgd2 = legend('\omega_1','\omega_2','\omega_3');
ylabel('Amplitude')
xlabel('Time [n]')

% Create ellipse
annotation(gcf,'ellipse',...
    [0.454271028037384 0.864864864864865 0.131398753894081 0.0977130977130982],...
    'LineWidth',2,...
    'LineStyle',':');

% Create textbox
% annotation(gcf,'textbox',...
%     [0.580996884735204 0.911508662959276 0.22890705943704 0.0757969503463393],...
%     'String','\bf{Non}-synchronized',...
%     'FontSize',14,...
%     'FontName','Times New Roman',...
%     'EdgeColor','none');

text(115,1.07,'{\bf Non}-synchronized','FontName','Times New Roman','FontSize',16)
lgd2.FontSize = 16;

