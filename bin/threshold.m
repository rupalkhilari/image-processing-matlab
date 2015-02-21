% Topic : Thresholding (Special case of Contrast Stretching)

clc;
clear all;
th=input('Enter the threshold value (0-255) ');
i=imread('cameraman.tif');
subplot(1,2,1);
imshow(i);
title('Original Image');

s=size(i);
for x=1:s(1)
    for y=1:s(2)
        if i(x,y)<th
            p(x,y)=0;
        else
            p(x,y)=255;
        end
    end
end
subplot(1,2,2);
imshow(p);
title(['Thresholded image with Threshold value=',num2str(th)]);
 
