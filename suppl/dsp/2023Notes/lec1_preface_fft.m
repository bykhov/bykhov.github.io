clearvars
close all

set(0,'DefaultAxesXGrid','on')
set(0,'DefaultAxesYGrid','on')
set(0,'defaultFigureColor','w')
set(0,'defaultTextFontName','Times New Roman')
set(0,'defaultAxesFontSize',16)
set(0,'defaultAxesFontName','Times New Roman')
set(0,'DefaultLineLineWidth',1.75)
fs = 200e3;
%% Time plot
x = @(n) cos(.48*n*pi) + cos(.52*n*pi);
M = 100;
n = 0:M-1;

figure(1)
plot(n/fs*1e3,x(n))
set(gcf,'Color','w','Name','Time Plot')
xlabel('Time [msec]')
ylabel('x(t)')
grid on

%%
figure(2)
stem([-52 -48 48 52],[1/2 1/2 1/2 1/2])
axis([-60 60 -0.1 0.6])
grid on
set(gcf,'Color','w','Name','Time Plot')
xlabel('Frequency [kHz]')
ylabel('Amplitude, |X(jf)|')
set(gca,'XTick',[-52 -48 48 52],'XTickLabel',{'-52','-48','48','52'},'XTickLabelRotation',90)

%% 512 samples
N = 512;
M = N;
n = 0:M-1;

figure(3)
plot(((0:N-1)/N-1/2)*fs/1e3,abs(fft(x(n),N))/M)
grid on
set(gcf,'Color','w','Name','100 samples')
xlabel('Frequency [kHz]')
ylabel('Amplitude, |X(jf)|')
%set(gca,'XTick',[-52 -48 48 52],'XTickLabel',{'-52','-48','48','52'},'XTickLabelRotation',90)


%% 50 samples
M = 50;
n = 0:M-1;
figure(4)
plot(((0:N-1)/N-1/2)*fs/1e3,abs(fft(x(n),N))/M)
grid on
set(gcf,'Color','w','Name','50 samples')
xlabel('Frequency [kHz]')
ylabel('Amplitude, |X(jf)|')

%% 10 samples
M = 10;
n = 0:M-1;
figure(5)
plot(((0:N-1)/N-1/2)*fs/1e3,abs(fft(x(n),N))/M)
grid on
set(gca,'FontSize',16,'FontName','Times New Roman','LineWidth',1.25)
set(gcf,'Color','w','Name','10 samples')
xlabel('Frequency [kHz]')
ylabel('Amplitude, |X(jf)|')


%% 100 samples + Hamming
M = 50;
n = 0:M-1;
figure(6)
plot(((0:N-1)/N-1/2)*fs/1e3,abs(fft(x(n).*hamming(M)',N))/M)
grid on
set(gcf,'Color','w','Name','100 samples + Hamming')
xlabel('Frequency [kHz]')
ylabel('Amplitude, |X(jf)|')