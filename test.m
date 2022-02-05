fid=fopen('1.bnp','r');

data=(fread(fid,'uint8'))
figure(1)
imshow(data);
colormap(gray);
axis image

