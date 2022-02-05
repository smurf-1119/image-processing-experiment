figure(1)
I = fitsread('solarspectra.fts');
I = rescale(I);
subplot(321)
imshow(I)
J = imrotate(I,45,'bilinear','crop');
subplot(322)
imshow(J)
J1 = imrotate(I,90,'bilinear','crop');
subplot(323)
imshow(J1)
J2 = imrotate(I,-1,'bilinear','crop');
subplot(324)
imshow(J2)

J3 = imrotate(I,45,'nearest','crop');
subplot(325)
imshow(J3)
J4 = imrotate(I,45,'bicubic','crop');
subplot(326)
imshow(J4)
