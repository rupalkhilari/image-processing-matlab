% Topic : Bit Plane Slicing 
% Name : Rupal Khilari
% Class : Msc IT - Part 1

clc;
clear all;
i=imread('cameraman.tif');
s=size(i);
imshow(i);
title('Original Image');
slice=imread('cameraman.tif');
figure;
for counter=0:7
   count=8-counter; 
for x=1:s(1)
    for y=1:s(2)
        a=double(i(x,y));
        bin_a=dec2bin(a,8);
        for z=1:8
            if z==count
                slice(x,y)=bin2dec(bin_a(z));
            end
        end
    end
end
subplot(2,4,count);
imshow(slice,[]);
title(['Bit-Plane ',num2str(counter)]);
end
 
