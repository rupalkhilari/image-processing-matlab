% Topic : Gray Level Slicing 
% Name : Rupal Khilari
% Class : Msc IT - Part 1

clc;
clear all;
i=imread('cameraman.tif');
subplot(2,2,1);
imshow(i);
title('Original Image');
s=size(i);
r1=input('Enter the value of r1 ');
r2=input('Enter the value of r2 ');
bg=input('Enter the byte value of background colour ');

for x=1:s(1)
    for y=1:s(2)
        if i(x,y)>=r1 && i(x,y)<=r2
            p(x,y)=255;
            p1(x,y)=255;
        else
            p(x,y)=bg;
            p1(x,y)=i(x,y);
        end 
    end
end

subplot(2,2,3);
imshow(uint8(p));
title('Gray Level Slicing(Without background)');

subplot(2,2,4);
imshow(uint8(p1));
title('Gray Level Slicing (With Background)');



 
