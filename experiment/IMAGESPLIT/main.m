img=im2double(imread('sample.jpg'));
Wh=[[0 0 0] [-1 1 0] [0 0 0]];
Wv=[[0 -1 0] [0 1 0] [0 0 0]];
figure();
subplot(231);
imshow(img);
title('original image');
rh1=conv2(img,Wh);
rv1=conv2(img,Wv);
subplot(232);
imshow(rh1)
title('Gx image');
subplot(233);
imshow(rv1)
title('Gy image');
r1=sqrt(rh1.*rh1+rv1.*rv1)
subplot(234);
imshow(r1);
title('method1');
r2=abs(rh1)+abs(rv1);
subplot(235);
imshow(r2);
title('method2');
r3=max(abs(rh1),abs(rv1));
subplot(236);
imshow(r3);
title('method3');