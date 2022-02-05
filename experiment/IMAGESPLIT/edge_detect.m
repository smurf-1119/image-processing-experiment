function [Img] = edge_detect(img,Wh,Wv)
%SOBEL 此处显示有关此函数的摘要
%   此处显示详细说明
rh1=conv2(img,Wh);
rv1=conv2(img,Wv);
title('Gy image');
Img=sqrt(rh1.*rh1+rv1.*rv1);
end

