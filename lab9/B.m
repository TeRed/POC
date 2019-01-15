close all;
clearvars;
clc;

global prog;
global lim;
global index;
global flaga;

prog = 0.05;
lim = 8;
index = 1;
flaga = 0;

I = imread('src/umbrealla.png');
I = double(I);
I = rgb2hsv(I);

H = I(:,:,1);

[X, Y] = size(I);
segRes = zeros(X,Y);
MRes = zeros(X,Y);

split(H,[1,1],255)




for i = 1:index
   IB = segRes == i;
   
   if any(IB(:) == 0)
       continue;
   end
   
   [xFM, yFM] = find(IB,1,'first');
   
   IBD = imdilate(IB,strel('square', 3));
   
   IBDiff = imdiff(IBD, IB);
   
   neighs = unique(nonzeros(IB .* segRes));
   
   flaga = 0;
   
   for el = neighs
      IB2 = segRes == el;
      [xF, yF] = find(IB2,1,'first');
      
      if absdiff(MRes(xFM, yFM) - MRes(xF, yF)) < (5/255)
          segRes(IB2) = i;
          flaga = 1;
      end
   end
   
   if flaga == 1
      i = i - 1; 
   end
   
end

figure;
imshow(segRes, []);


function split(I,tl,len)
    m = mean(I(tl(1):tl(1)+len,tl(2):tl(2)+len));
    s = std(I(tl(1):tl(1)+len,tl(2):tl(2)+len));
    
    if s >= 0.05 && len > 8
        split(I,tl,len/2);
        split(I,[tl(1) + len/2, tl(2)],len/2);
        split(I,[tl(1), tl(2) + len/2],len/2);
        split(I,[tl(1) + len/2, tl(2) + len/2],len/2);
    else
        segRes(tl(1):tl(1)+len,tl(2):tl(2)+len) = index;
        MRes(I(tl(1):tl(1)+len,tl(2):tl(2)+len)) = m;
        index = index + 1;
    end
    
end


