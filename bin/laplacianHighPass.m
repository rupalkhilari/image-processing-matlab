 
% Topic : High Pass filter using Laplacian 
clc;
clear all;
close all;
 
i = imread('cameraman.tif');
f = fft2(i);
 
f = fftshift(f);
 
[m n] = size(i);
 
 for x=1:m
    for y=1:n
        h(x,y)= -((x-m/2)^2+(y-n/2)^2);
        
    end
end
 
s = f .* h;
 
j = ifft2(fftshift(s));
 
figure(1);
imshow(i);
title('Original image');
 
figure(2);
imshow(abs(j),[]);
title('Laplacian High Pass Filtered image');

