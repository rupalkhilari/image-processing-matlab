 
clc;
clear all;
i = imread('F:\MATLAB6p5\work\a.tif');
 
figure(1);
imshow(i);
title('Original image');
 
% Using square as a structural element'
se = strel('square',3);
p = imerode(i,se);
figure(2);
subplot(2,3,1);
imshow(p,[]);
title('Erode using square');
 
p = imdilate(i,se);
subplot(2,3,2);
imshow(p,[]);
title('Dilate using square');
 
p = imopen(i,se);
subplot(2,3,3);
imshow(p,[]);
title('Open using square');
 
p = imclose(i,se);
subplot(2,3,4);
imshow(p,[]);
title('Close using square');
 
p = double(i) - double(imerode(i,se));
subplot(2,3,5);
imshow(p,[]);
title('Boundary extraction using square');
 
%Using rectangle as a structural element:'
se = strel('rectangle',[3 3]);
p = imerode(i,se);
figure(3);
subplot(2,3,1);
imshow(p,[]);
title('Erode using rectangle');
 
p = imdilate(i,se);
subplot(2,3,2);
imshow(p,[]);
title('Dilate using rectangle');
 p = imopen(i,se);
subplot(2,3,3);
imshow(p,[]);
title('Open using rectangle');
 
p = imclose(i,se);
subplot(2,3,4);
imshow(p,[]);
title('Close using rectangle');
 
p = double(i) - double(imerode(i,se));
subplot(2,3,5);
imshow(p,[]);
title('Boundary extraction using rectangle:');
 
%Using disk as a structural element:'
se = strel('disk',4,4);
p = imerode(i,se);
figure(4);
subplot(2,3,1);
imshow(p,[]);
title('Erode using disk');
 
p = imdilate(i,se);
subplot(2,3,2);
imshow(p,[]);
title('Dilate using disk');
 
p = imopen(i,se);
subplot(2,3,3);
imshow(p,[]);
title('Open using disk');
 
p = imclose(i,se);
subplot(2,3,4);
imshow(p,[]);
title('Close using disk');
 
p = double(i) - double(imerode(i,se));
subplot(2,3,5);
imshow(p,[]);
title('Boundary extraction using disk');
 
%Using triangle as a structural element:'
se = strel([0 1 0;1 0 1;1 1 1]);
p = imerode(i,se);
figure(5);
subplot(2,3,1);
imshow(p,[]);
title('Erode using triangle');
 p = imdilate(i,se);
subplot(2,3,2);
imshow(p,[]);
title('Dilate using triangle');
 
p = imopen(i,se);
subplot(2,3,3);
imshow(p,[]);
title('Open using triangle');
 
p = imclose(i,se);
subplot(2,3,4);
imshow(p,[]);
title('Close using triangle');
 
p = double(i) - double(imerode(i,se));
subplot(2,3,5);
imshow(p,[]);
title('Boundary extraction using triangle');
