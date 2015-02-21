 
%Topic : Histogram Specification
%Name : Rupal K
%Class : Msc IT Part 1

clc;
clear all;
i=imread('pout.tif');
subplot(2,4,1);
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
%for x=1:256
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

%--------------
%%For the reference histogram image

j=imread('F:\MATLAB6p5\work\Lena.bmp');
s=size(j);
len1=s(1)*s(2);

%Assigning zq
for x=0:255
    zq(x+1)=x;
end

%Calculating Normalized zq
for x=0:255
    nzq(x+1)=double(zq(x+1)/255.0);
end

%Initializing nk1
for x=1:256
    nk1(x)=0;
end

%Calculating count of rk1 from i
for x=1:len1
    nk1(j(x))=nk1(j(x))+1;
end

%Verifying the sum 
%sum=0;
%for x=1:256
%    sum=sum+nk1(x);
%end

%Calculating prk1
for x=0:255
  pzq(x+1)=double(nk1(x+1)/len1);
end

%Calculating cdf1
cdf1(1)=pzq(1);
for x=1:255
    cdf1(x+1)=cdf1(x)+pzq(x+1);
end







%Finding closest value between cdf and cdf1
for x=0:255
    min=abs(double(cdf(x+1)-cdf1(1))); %Assign minimum value to the diff. between first elements
    for y=0:255
        temp=abs(double(cdf(x+1)-cdf1(y+1)));
        if min>temp
            zk(x+1)=zq(y+1);
            min=temp;
        end
    end
end

s=size(i);
%Creating newimg by Mapping rk to zk
for x=1:s(1)
    for y=1:s(2)
        oldval=i(x,y);
        newimg(x,y)=uint8(zk(double(oldval)+1));
    end
end

subplot(2,4,2);
imhist(i);
title('Histogram of ori. img');

subplot(2,4,3);
imshow(j);
title('Reference image');

subplot(2,4,4);
imhist(j);
title('Histogram of ref. img');

subplot(2,4,5);
imshow(newimg,[]);
title('Image after Hist. Spec.');

subplot(2,4,6);
imhist(newimg);
title('Histogram after Hist. Spec');

