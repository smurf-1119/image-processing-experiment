figure(1);
I = imread('1.bmp');
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I);
l1 = histeq(I);
subplot(2,2,3);
imshow(l1);
subplot(2,2,4);
imhist(l1);