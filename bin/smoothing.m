 
% Topic : Smoothing (Low Pass filter)(Spatial Domain)
% Name : Rupal K
% Class : Msc IT Part 1

clc;
clear all;
i=imread('cameraman.tif');
s=size(i);

dim=input('Enter the length of the filter mask ');
if dim<3 || mod(dim,2)==0
   'Invalid Entry, length should be an odd number greater than or equal to 3'
else 
    
    w=ones(dim);
    padding_len=floor(dim/2);

    trg_x=s(1)+(2*padding_len);
    trg_y=s(2)+(2*padding_len);
    
    c=dim*dim;
  %  p=ones(trg_x);
  m=padding_len+1;  %Postion from where the actual image starts in f
  
  
  %CReating the new image with padding
  for x=1:trg_x
      for y=1:trg_y
          if x<m 
          f(x,y)=0;
          elseif y<m
              f(x,y)=0;
          elseif x>s(1)+padding_len
              f(x,y)=0;
          elseif y>s(2)+padding_len
              f(x,y)=0;
          else
              f(x,y)=i(x-padding_len,y-padding_len);
          end
      end
  end

  p=zeros(trg_x);
    for x=m:trg_x-padding_len
        for y=m:trg_y-padding_len
            
            sum=0;
            rx=x-padding_len;
            ry=y-padding_len;
            for x1=0:dim-1
                for y1=0:dim-1      
                   sum=sum+(double(f(rx+x1,ry+y1))*w(x1+1,y1+1));
                end
            end
            sum=sum/c;
          p(x,y)=uint8(floor(sum));   %Stores the processed image
        end
    end
    
    %Creating the final image
    for x=m:trg_x-padding_len
        
        for y=m:trg_y-padding_len
            resp(x-padding_len,y-padding_len)=uint8(p(x,y));
        end
    end
    
    
  subplot(1,2,1);
    imshow(i);
    title('Original Image');
    subplot(1,2,2);
    imshow(resp);
    title(['Smoothing with average filter :Mask size = ',num2str(dim),'x',num2str(dim)]);
end

