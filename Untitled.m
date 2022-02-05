I = zeros(100, 100);
for i=20:1:80,
    for j=20:1:80,
        I(i,j)=1;
    end
end

X=(imread('1.jpg'));
X  = X(:,:,1);
s = size(X)
I1 = fft2(X);
I2 = ifft2(I1);

r = fftshift(real(I1))

figure(1);
subplot(1,2,1), imshow(r);
subplot(1,2,2), imshow(uint8(I2));