clearvars;
close all;
clc;

I = imread('parrot.bmp');
figure(1);
imshow(I);

xReScale = 1.5;
yReScale = 1.5;

[YY, XX] = size(I);

nYY = floor(YY * yReScale);
nXX = floor(XX * xReScale);
nI = uint8(zeros(nYY, nXX));

xStep = XX / nXX;
yStep = YY / nYY;

for jj = 0:(nYY-1)
   for ii = 0:(nXX-1)
       i = floor(ii * xStep);
       j = floor(jj * yStep);
       
       if j > YY - 1
           j = YY - 1;
       end
   
       if i > XX - 1
           i = XX - 1;
       end

       nI(jj + 1, ii + 1) = I(j + 1, i + 1);
   end
end

figure(2);
imshow(nI);
