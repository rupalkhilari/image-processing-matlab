 
% Topic : Ideal Low Pass filtering 
% Name : Rupal Khilari
% Class : Msc IT - Part 1 

clc;
clear all;

i=imread('cameraman.tif');
s=size(i);
M=s(1);
N=s(2);
D0=input('Enter the cutoff frequency : ');

% finding filter transfer function H
for u=1:M
    for v=1:N
term1=power(u-(M/2),2);
term2=power(v-(N/2),2);
sum=term1+term2;
D(u,v)=sqrt(sum);
        if D(u,v)<=D0
            H(u,v)=1;
        else
            H(u,v)=0;
        end
    end
end

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
title(['Filtering with Ideal Low Pass Filter - radius :',num2str(D0)]);

