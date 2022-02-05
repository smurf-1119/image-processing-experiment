clear,clc;
 
% 读取图像
Img = imread('1.png');
M = size(Img);
if numel(M)>2
    gray = rgb2gray(Img);
else
    gray = Img;
end
 
% 创建滤波器
W = fspecial('gaussian',[5,5],1); 
G = imfilter(gray, W, 'replicate');
figure(1);
subplot(231); imshow(gray); title('原始图像');
subplot(232); imshow(G);    title('高斯滤波后图像');

I_3=fspecial('average',[3,3]);%3*3均值滤波
I_3=imfilter(gray,I_3);
subplot(233);
imshow(I_3,[]);title('3*3均值滤波');

I_4= medfilt2(gray); %进行3 × 3模板的中值滤波
subplot(234);
imshow(I_4,[]);title('3*3中值滤波');

I=im2double(Img)
I_5= kuwaharafilt(Img,8);
subplot(235);
imshow(I_5,[]);title('Kuwahara 滤波');

%图像模糊

LEN = 5;
THETA = 5;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');

wnr3 = deconvwnr(blurred, PSF, 0.01);
subplot(236);
imshow(wnr3)
title('维纳滤波');