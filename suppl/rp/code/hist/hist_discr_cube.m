N = 1e6;
x = randi(6,[1 N]);
for k = 1:6
    empirical_pdf(k) = sum(x == k,2)/N;
end

subplot(211)
bar(empirical_pdf)
subplot(212)
histogram(x)

mean(x)

%%
empirical_pdf = sum(x == (1:6)',2)/N
