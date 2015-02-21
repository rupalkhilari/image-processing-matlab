clc;
clear all;

i = imread('F:\MATLAB6p5\work\forest1.bmp');
 
imshow(i);
title('Original image');
s = size(i);
c = 2;
 
i = double(i);
 
for x=1:s(1)
    for y=1:s(2)
        j(x,y) = c * log(1 + i(x,y));
    end
end

figure;
imshow(j,[]);
title('Log transformed image');
