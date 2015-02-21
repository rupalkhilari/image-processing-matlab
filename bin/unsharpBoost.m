% Topic : High Boost Filtering using unsharp masking 
% Name : Rupal K
% Class : MSc IT - Part 1 

clear all 
clc 
A=input('Enter the value of A : '); 
im = imread('tire.tif');


imshow(uint8(im)) 
title('Original Image');  



w=[1 1 1;1 1 1;1 1 1]; %Creating the mask for LPF
[m n] = size(im);
 
im = [im(1:m,1:n);zeros(1,n)];
 
im = [im(1:m+1,1:n),zeros(m+1,1)];
 
im = [zeros(1,n+1);im(1:m+1,1:n+1)];
 
im = [zeros(m+2,1),im(1:m+2,1:n+1)];

f=double(im);

[row col]=size(f); 

for i=2:1:row-1 
    for j=2:1:col-1 
        fl(i,j) =[ (w(1) * f(i-1,j-1)) + (w(2) * f(i-1,j)) + (w(3) * f(i-1,j+1)) + (w(4) *  f(i,j-1)) + (w(5) * f(i,j)) + (w(6) * f(i,j+1)) + (w(7) * f(i+1,j-1)) + (w(8) * f(i+1,j)) + (w(9) * f(i+1,j+1)) ]; 
    end 
end 

fl=fl./sum(w(1:9));  % Dividing by the sum

figure;
subplot(2,2,1);
imshow(uint8(fl)) ;
title('Low Pass Filtered Image'); 

w=[-1 -1 -1;-1 8 -1;-1 -1 -1]; %Creating the mask for HPF
for i=2:1:row-1 
    for j=2:1:col-1 
        fh(i,j) =[ (w(1) * f(i-1,j-1)) + (w(2) * f(i-1,j)) + (w(3) * f(i-1,j+1)) + (w(4) *  f(i,j-1)) + (w(5) * f(i,j)) + (w(6) * f(i,j+1)) + (w(7) * f(i+1,j-1)) + (w(8) * f(i+1,j)) + (w(9) * f(i+1,j+1)) ]; 
    end 
end 
subplot(2,2,2);
imshow(uint8(fh)) ;
title('High Pass Filtered Image'); 




%Unsharp Masking 
for i=2:1:row-1 
    for j=2:1:col-1 
        fs(i,j) =f(i,j)-fl(i,j);
    end 
end 

subplot(2,2,3);
imshow(uint8(fh)) ;
title('Image after unsharp masking'); 

%High Boost Filtering using formula 
for i=2:1:row-1 
    for j=2:1:col-1 
        fhb(i,j) =((A-1)*f(i,j))+fs(i,j);
    end 
end 

fhb=[fhb(2:row-1,2:col-1)];  % Getting the image to original size 

subplot(2,2,4);
imshow(uint8(fhb)) ;
title(['High Boost Filtered Image with A=',num2str(A)]); 
 
