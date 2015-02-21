 
% Wavelet Transform using Daubechies filter

clc;
clear all;
close all;

 i = imread('cameraman.tif');
figure(1);
imshow(i);
title('Original image');

[a h v d] = dwt2(double(i),'db1');
 i = [a,h;v,d];

figure(2);
imshow(i,[]);
title('1st Level decomposition showing Approximate,Horizontal, Vertical, Diagonal Details');
 z = zeros(size(h));
 
figure(3);
i=idwt2(z,h,v,d,'db1');
imshow(i,[]);
title('HPF image');

 figure(4);
i=idwt2(a,z,z,z,'db1');
imshow(i,[]);
title('LPF image');

[a2 h2 v2 d2]=dwt2(a,'db1');
f2=[a2 h2;v2 d2];
f3=[f2 h;v d];

figure(5);
imshow(f3,[]);
title('Second Level Decomposition');


