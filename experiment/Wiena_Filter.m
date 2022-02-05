clear;
%读取图片
I=imread('./sample.jpg');
%I=rgb2gray(I); 

[m,n]=size(I);
F=fftshift(fft2(I));%FFT 转换到频域
k=0.0025; 
H=blur_with_Gaussian(m,n,k) 
G=F.*H; %点乘
I0=real(ifft2(fftshift(G))); 
I1=imnoise(uint8(I0),'gaussian',0,0.001)
F0=fftshift(fft2(I1));
F1=F0./H; 
I2=ifft2(fftshift(F1)); 

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

 
K=0.01;

 
for u=1:m
  for v=1:n 
       H(u,v)=exp(-k*(((u-m/2)^2+(v-n/2)^2)^(5/6)));
       H0(u,v)=(abs(H(u,v)))^2; 
       H1(u,v)=H0(u,v)/(H(u,v)*(H0(u,v)+K));
  end
end 
F2=H1.*F0; 
I3=ifft2(fftshift(F2)); 
subplot(2,2,4);
imshow(uint8(I3));
title("维纳滤波复原图");