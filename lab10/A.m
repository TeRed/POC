close all;
clearvars;
clc;

global prog; prog = 0.05;
global limit; limit = 8;
global index; index = 1;
global segRes;
global MRes;

I = imread('src/umbrealla.png');

figure;
subplot(2,2,1);
imshow(I);
title('Początkowy obraz');

I = double(rgb2hsv(I));
I = I(:,:,1);

subplot(2,2,2);
imshow(I, []);
title('Odcień');

[I_x,I_y] = size(I);

segRes = zeros(I_x,I_y);
MRes = zeros(I_x,I_y);

split(I,1,1,I_x,I_y);

i = 0;
while i <= index
   IB = segRes == i;
   
   if ~any(IB(:) == 0)
      i = i + 1;
      continue;
   end
   
   [xF, yF] = find(IB,1,'first');
   IBdilated = imdilate(IB, strel('square',3));
   IBdiff = imabsdiff(IBdilated, IB);

   neighbours = unique(nonzeros(segRes .* IBdiff));

   flag = 0;

   for j = (neighbours')
       IB = segRes == j;
       [xF2, yF2] = find(IB,1,'first');

       if (abs(MRes(xF,yF) - MRes(xF2,yF2)) < (5/255))
           segRes(IB) = i;
           flag = 1;
       end
   end
   
   if flag == 0
        i = i + 1;
   end
end

subplot(2,2,3);
imshow(segRes, []);
title('Łączenie');

for i = unique(segRes)'
    C = segRes == i;
    if sum(C) < 30
        segRes(C) = 0;
    end
end

Iuniq = unique(segRes);

for i = 1:numel(Iuniq)
    C = segRes == Iuniq(i);
    segRes(C) = i;
end

subplot(2,2,4);
imshow(label2rgb(segRes));
title('Filtracja i wizualizacja');

function split(I, xS, yS, xE, yE)
    global prog;
    global limit;
    global index;
    global segRes;
    global MRes;
    
    Isub = I(xS:xE, yS:yE);
    s = std(Isub(:));
    m = mean(Isub(:));
    
    if (s < prog || (yE - yS) <= limit)
        segRes(xS:xE, yS:yE) = index;
        index = index + 1;
        MRes(xS:xE, yS:yE) = m;
    else
        xM = floor((xS+xE)/2);
        yM = floor((yS+yE)/2);
        split(I,xS,yS,xM,yM);
        split(I,xM+1,yS,xE,yM);
        split(I,xM+1,yM+1,xE,yE);
        split(I,xS,yM+1,xM,yE);
    end
end