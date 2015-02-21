 
clc;
clear all;
i = imread('F:\MATLAB6p5\work\binary.bmp');
 
[m n] = size(i);
 
figure;
imshow(i);
title('Original image');

f = fspecial('average',[2 2]);
i = filter2(f,i);
p = edge(i,'sobel');

figure;
imshow(p);
title('Edge detection using Sobel Method');

b = bwlabel(p,8);
[r c] = find(b==1);
rc = [r c];

seg_im = zeros(m,n);
[m n] = size(rc);

for x=1:m
    x1 = rc(x,1);
    y1 = rc(x,2);
    seg_im(x1,y1) = 255;
end
 
figure;
imshow(seg_im,[]);
title('Segmented image');



