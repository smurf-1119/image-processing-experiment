img=im2double(imread('sample.jpg'));
Wh1=(1/3).*[[-1 0 1] [-1 0 1] [-1 0 1]];
Wv1=(1/3).*[[-1 -1 -1] [0 0 0] [1 1 1]];

Img1=edge_detect(img, Wh1, Wv1);

Wh2=(1/4).*[[-1 0 1] [-2 0 2] [-1 0 1]];
Wv2=(1/4).*[[-1 -2 -1] [0 0 0] [1 2 1]];
Img2=edge_detect(img, Wh2, Wv2);

Wh3=(1/(2+sqrt(2))).*[[-1 0 1] [-sqrt(2) 0 sqrt(2)] [-1 0 1]];
Wv3=(1/(2+sqrt(2))).*[[-1 -sqrt(2) -1] [0 0 0] [1 sqrt(2) 1]];
Img3=edge_detect(img, Wh3, Wv3);

Wh4=[[-1 0 0] [0 1 0] [0 0 0]];
Wv4=[[0 -1 0] [1 0 0] [0 0 0]];
Img4=edge_detect(img, Wh4, Wv4);

Wh=[[0 0 0] [-1 1 0] [0 0 0]];
Wv=[[0 -1 0] [0 1 0] [0 0 0]];
Img=edge_detect(img, Wh, Wv);
subplot(231);
imshow(img);
title('original img');
subplot(232);
imshow(Img);
title('m1 img');
subplot(233);
imshow(Img1);
title('Prewitt');
subplot(234);
imshow(Img2);
title( 'Sobel');
subplot(235);
imshow(Img3);
title( 'Sobel2');
subplot(236);
imshow(Img4);
title('Roberts');
