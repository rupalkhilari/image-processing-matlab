clc;
clear all;
 
i = imread('cameraman.tif');
imshow(i);
title('Original image');
s = size(i);
 
c = 1;
i = double(i);
gamma = input('Enter the value of gamma : ');
for x=1:s(1)
    for y=1:s(2)
        j(x,y) = c * (i(x,y) ^ gamma);
    end
end
figure;
imshow(j,[]);
title(['Power law transformed image with gamma=',num2str(gamma)]);
 
