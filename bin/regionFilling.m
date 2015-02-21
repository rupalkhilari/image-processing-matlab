 
clc;
clear all;
 
i=[0 0 0 0 0 0 0
   0 0 1 1 0 0 0
   0 1 0 0 1 0 0
   0 1 0 0 1 0 0
   0 0 1 0 1 0 0
   0 0 1 0 1 0 0
   0 1 0 0 0 1 0 
   0 1 0 0 0 1 0
   0 1 1 1 1 0 0
   0 0 0 0 0 0 0];

ic = ones(size(i)) - i;
 
colormap('gray');
subplot(1,2,1);
imagesc(i);
title('Original image');
 
x = zeros(size(i));
 
flag = 0;
 
x(3,3) = 1;
 
res = zeros(size(i));
 
B = [0 1 0; 1 1 1; 0 1 0];                      
 
while flag == 0
xnew = and(imdilate(x,B),ic);    
if(sum(xnew-x)==0)
    flag = 1;
else
   	 x = xnew;
end
end
 
res = x + i;
 
subplot(1,2,2);
imagesc(res);
title('Region filled image');

