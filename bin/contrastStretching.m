% Topic : Contrast Stretching 
% Name : Rupal K
% Class : Msc IT Part 1 

clc;
clear all;
i=imread('pout.tif');
r1=input('Enter the value of r1 (64-128)');
r2=input('Enter the value of r2 (129-192)');
s1=input('Enter the value of s1 (0-64)');
s2=input('Enter the value of s2 (192-255)');

s=size(i);
subplot(1,2,1);
imshow(i);
title('Original Image');
% Calculating l
l=s1/r1;
%Calculating m
m=(s2-s1)/(r2-r1);
%Calculating n
n=(255-s2)/(255-r2);

for x=1:s(1)
    for y=1:s(2)
        if i(x,y)>=0 && i(x,y)<r1
            p(x,y)=l*double(i(x,y));
        elseif i(x,y)>=r1 && i(x,y)<r2
            p(x,y)=m*(double(i(x,y))-r1)+s1;
        elseif i(x,y)>=r2 && i(x,y)<=255
            p(x,y)=n*(double(i(x,y))-r2)+s2;
        end
    end
end
 subplot(1,2,2);
 imshow(uint8(p));
 title('After contrast stretching');
 
