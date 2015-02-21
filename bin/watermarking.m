 
% Topic : Watermarking
% Class : Msc IT Part 1 
% Name : Rupal K 

clc;
clear all;
i=imread('ic.tif');
h=imread('hidden.bmp');
s=size(i);
subplot(2,2,1);
imshow(h);
title('Image to be used for Watermarking');
subplot(2,2,2);
imshow(i);
title('Original Image');
trg='';
for x=1:s(1)
    for y=1:s(2)
        a=double(i(x,y));
        bin_a=dec2bin(a,8);
        trg='';
        for z=1:8
            if z==8
                temp=double(h(x,y));
                trg=[trg,num2str(temp)];
            else
                trg=[trg,bin_a(z)];
            end
        end
        slice(x,y)=uint8(bin2dec(trg));
    end
end

%imshow(slice);%title('Enhanced Image');
%Saving the enhanced image to a file
imwrite(slice,'NewImg.tif','tiff');

% Retriving the image 
count=8-0;
trg='';
i=imread('NewImg.tif');

for x=1:s(1)
    for y=1:s(2)
        a=double(i(x,y));
        bin_a=dec2bin(a,8);
         if bin_a(8)=='0'
            slice(x,y)=0;
        else slice(x,y)=255;
        end
    end
end

subplot(2,2,3);
imshow(i);
title('Watermarked Image');
subplot(2,2,4);
imshow(slice);
title('Retrieved Hidden Message');
