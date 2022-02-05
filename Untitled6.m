
figure(1);
P = peaks(20);
X = repmat(P,[5 10]);
subplot(1,3,1),imagesc(X)

Y = fft2(X);
subplot(1,3,2),imagesc(abs(fftshift(Y)))

Y = fft2(X,2^nextpow2(100),2^nextpow2(200));
subplot(1,3,3),imagesc(abs(fftshift(Y)));