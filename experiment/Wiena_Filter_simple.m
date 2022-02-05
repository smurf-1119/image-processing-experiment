clear;
%读取图片
I=imread('sample.jpg');
%I=rgb2gray(I); 

%图像模糊

[m,n]=size(I);
F=fftshift(fft2(I));%FFT 转换到频域
k=0.0025; 
H=blur_with_Gaussian(m,n,k)  
G=F.*H; %点乘
I0=real(ifft2(fftshift(G))); 
I1=imnoise(uint8(I0),'gaussian',0,0.001)


%图像逆滤波
h=real(ifft2(fftshift(H))); 
I2=fftshift(deconvwnr(I1, h));


%图像维纳
K=0.01
I3=fftshift(deconvwnr(I1, h, K)); 


figure; 
subplot(2,2,1);
imshow(I);
title('原图');
subplot(2,2,2);
imshow(uint8(I1));
title('模糊退化且添加高斯噪声的图像');
subplot(2,2,3);
imshow(uint8(I2));
title('全逆滤波复原图');
subplot(2,2,4);
imshow(uint8(I3));
title("维纳滤波复原图");