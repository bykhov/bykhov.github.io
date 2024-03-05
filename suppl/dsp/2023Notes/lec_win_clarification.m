N = 64;

h = hamming(N);

[H, w] = freqz(h,1,N*64,'whole');

main_lobe_width = 8/N
trans_width = 6.64/N/2

figure(1)
plot((w-pi)/pi,fftshift(abs(H))/N)
grid on

figure(2)
plot((w-pi)/pi,fftshift(abs(H))/N)
xlim([-.1 .1])
grid on


figure(3)
plot((w-pi)/pi,20*log10(fftshift(abs(H))/N))
xlim([-.1 .2])
grid on
