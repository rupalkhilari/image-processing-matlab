 
% Topic : Gaussian High Pass filtering 
% Name : Rupal K 
% Class : Msc IT - Part 1 

clc;
clear all;
i=imread('F:\MATLAB6p5\work\a.tif');
s=size(i);
M=s(1);
N=s(2);
D0=input('Enter the cutoff frequency : ');

imshow(i,[]);
title('Original Image');
% finding filter transfer function H
for u=1:M
    for v=1:N
term1=power(u-(M/2),2);
term2=power(v-(N/2),2);
sum=term1+term2;
D(u,v)=sqrt(sum);
        temp1=-power(D(u,v),2);
        temp2=2*power(D0,2);
        H(u,v)=1-power(2.7183,double(temp1/temp2));
    end
end
figure;
imshow(H,[]); 
title('Filter transfer function');
% 1) Multiply the input image by (-1)^(x+y) to center the transform
% 2) Compute F(u,v) the DFT of the image 

h=fft2(i);    
F=fftshift(h); 
figure;
imshow(log(1+real(abs(F))),[]);
title('Centered Fourier Transform(log)');

for u=1:M
    for v=1:N
        G(u,v)=H(u,v)*F(u,v);   % 3) Multiply F(u,v) by a filter function H(u,v)
    end
end

figure;
imshow(log(1+real(abs(G))),[]);
title('On Multiplying Fourier Transform with filter (log)');

hh=ifft2(G);  % 4 ) Inverse DFT of result in (3) 
realG=real(abs(hh));    % 5) Obtain the real part of the result in (4) 
%final=fftshift(realG);  % 6) Multiply result in (5) by (-1)^(x+y) 

figure;
imshow(realG,[]);
title(['Gaussian High Pass Filtering -radius :',num2str(D0)]);

