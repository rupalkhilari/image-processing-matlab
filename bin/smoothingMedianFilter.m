 
% Topic : Smooothing using Median Filter(3x3 neighbourhood)
% Name : Rupal K
% Class : Msc IT - Part 1

clc;
clear all;
close all; 
i=imread('cameraman.tif');
ino=imnoise(i,'salt & pepper',0.03);
subplot(1,2,1);
imshow(ino,[]);
title('Image with salt & pepper noise');

s=size(ino);
p=zeros(s(1)+2,s(2)+2);

for x=2:s(1)+1
    for y=2:s(2)+1
        p(x,y)=ino(x-1,y-1);
    end
end

for x=2:s(1)+1
    for y=2:s(2)+1
       %find the median value 
       arr=sort([p(x-1,y-1) p(x-1,y) p(x-1,y+1) p(x,y-1) p(x,y) p(x,y+1) p(x+1,y-1) p(x+1,y) p(x+1,y+1)]);
       median=arr(5);
       res(x-1,y-1)=median;
       
    end
end

subplot(1,2,2);
imshow(res,[]);
title('Smoothing using median filter(3x3)');
