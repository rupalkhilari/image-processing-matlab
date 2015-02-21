% Topic : Negative of an Image

clc;
clear all;
arr=imread('cameraman.tif');
subplot(1,2,1);
imshow(arr);
title('Original Image');

s=size(arr);

for x=1:s(1)
    for y=1:s(2)
       
      p(x,y)=255-double(arr(x,y));

    end
end

subplot(1,2,2);
imshow(p,[]);
title('Negative Image');