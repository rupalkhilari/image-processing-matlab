% Topic : Sharpening using Laplacian Filter 

clear all 
clc 
 
im = imread('cameraman.tif'); 
 
 
w=[1 1 1;1 -8 1;1 1 1]; %Creating the high pass average mask 
[m n] = size(im);
 
im = [im(1:m,1:n);zeros(1,n)];
 
im = [im(1:m+1,1:n),zeros(m+1,1)];
 
im = [zeros(1,n+1);im(1:m+1,1:n+1)];
 
im = [zeros(m+2,1),im(1:m+2,1:n+1)];

p=double(im);

[row col]=size(p); 

for i=2:1:row-1 
    for j=2:1:col-1 
        p1(i,j) =[ (w(1) * p(i-1,j-1)) + (w(2) * p(i-1,j)) + (w(3) * p(i-1,j+1)) + (w(4) *  p(i,j-1)) + (w(5) * p(i,j)) + (w(6) * p(i,j+1)) + (w(7) * p(i+1,j-1)) + (w(8) * p(i+1,j)) + (w(9) * p(i+1,j+1)) ]; 
    end 
end 
 
subplot(1,2,1);
imshow(uint8(p)) 
title('Original Image'); 
p1=[p1(2:row-1,2:col-1)];
subplot(1,2,2);
imshow(uint8(p1)) ;
title('Image after High Pass Filtering');

 
