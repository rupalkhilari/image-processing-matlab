 
%Topic : Histogram Equalization 
%Name : Rupal K
%Class : Msc IT Part 1

clc;
clear all;
i=imread('pout.tif');
subplot(2,2,1);
imshow(i); 
title('Original Image');
s=size(i);
len=s(1)*s(2);

%Assigning rk
for x=0:255
    rk(x+1)=x;
end

%Calculating Normalized rk
for x=0:255
    nrk(x+1)=double(rk(x+1)/255.0);
end

%Initializing nk
for x=1:256
    nk(x)=0;
end

%Calculating count of rk from i
for x=1:len
    nk(i(x))=nk(i(x))+1;
end

%Verifying the sum 
%sum=0;
%for x=1:len
%    sum=sum+nk(x);
%end

%Calculating prk
for x=0:255
  prk(x+1)=double(nk(x+1)/len);
end

%Calculating cdf
cdf(1)=prk(1);
for x=1:255
    cdf(x+1)=cdf(x)+prk(x+1);
end



%Finding closest value between cdf and nrk
for x=0:255
    min=abs(double(cdf(x+1)-nrk(1))); 
%Assign minimum value to the diff. between first elements
    for y=0:255
        temp=abs(double(cdf(x+1)-nrk(y+1)));
        if min>temp
            sk(x+1)=rk(y+1);
            min=temp;
        end
    end
end
newimg=i;

%Creating newimg by Mapping rk to sk
for x=1:s(1)
    for y=1:s(2)
        oldval=i(x,y);
        newimg(x,y)=sk(double(oldval)+1);
    end
end

subplot(2,2,2);
imhist(i);
title('Histogram of Original Image');

subplot(2,2,3);
imshow(newimg);
title('After Histogram Equalization');

subplot(2,2,4);
imhist(newimg);
title('Histogram of Histogram Equalized image');

