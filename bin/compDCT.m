 
% Topic : Compression using DCT

clc;
clear all;
close all;
 
i = imread('cameraman.tif');
imshow(i,[]);
title('Original image');
 
%Level shifting
i = double(i);
i = i-128;
 
fun1 = @dct2;

%Preserving 10 out of 64 pixels out of each 8 x 8 block...
mask =[ 
     1     1     1     1     0     0     0     0;
     1     1     1     0     0     0     0     0;
     1     1     0     0     0     0     0     0;
     1     0     0     0     0     0     0     0;
     0     0     0     0     0     0     0     0;
     0     0     0     0     0     0     0     0;
     0     0     0     0     0     0     0     0;
     0     0     0     0     0     0     0     0];
 



%DCT
i1 = blkproc(i,[8 8],fun1);

%Quantization
i2 = blkproc(i1,[8 8],'P1.*x',mask);
 
fun2 = @idct2;
 
%IDCT
i3 = blkproc(i2,[8 8],fun2);

%Level Shifting 
i4=i3+128;  

figure;
imshow(i4,[]);
title('Compressed image');

figure; 
error=double(i)-i4;

imshow(error,[]);
title('Lost Information (Error)');













