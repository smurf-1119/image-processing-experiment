I = im2double(imread('cameraman.tif'));
figure;
subplot(2,2,1);
imshow(I);
title('Original Image (courtesy of MIT)');
LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');

noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
subplot(2,2,2);
imshow(blurred_noisy)
title('Simulate Blur and Noise')


wnr3 = deconvreg(blurred_noisy, PSF);
subplot(2,2,3)
imshow(wnr3)
title('deblur by regularized filter with SNR=0')

estimated_nsr = noise_var / var(I(:));
wnr4 = deconvreg(blurred_noisy, PSF, estimated_nsr);
subplot(2,2,4)
imshow(wnr4)
title('deblur by regularized filter');
