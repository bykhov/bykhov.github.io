N = 1e5;
s = 3;
x = s*randn(1,N);
filt = designfilt('lowpassfir', ...
    'PassbandFrequency',0.45,'StopbandFrequency',0.55, ...
    'PassbandRipple',1,'StopbandAttenuation',60);

% fvtool(filt)
h = filt.Coefficients;

y = filter(filt,x);
disp(['Signal variance = ' num2str(var(y))])
disp(['sum(h^2) = ' num2str(s^2 * sum(h.^2))])