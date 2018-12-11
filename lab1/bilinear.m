clearvars;
close all;
clc;

I = double(imread('parrot.bmp'));
figure(1);
imshow(uint8(I));

xReScale = 2;
yReScale = 2;

[YY, XX] = size(I);

nYY = floor(YY * yReScale);
nXX = floor(XX * xReScale);

nI = double(zeros(nYY, nXX));

xStep = XX / nXX;
yStep = YY / nYY;

for jj = 0:(nYY-1)
   for ii = 0:(nXX-1)
       iR = ii * xStep;
       jR = jj * yStep;
       
       if jR > YY - 2
           jR = YY - 2;
       end
   
       if iR > XX - 2
           iR = XX - 2;
       end
       
       i = floor(iR);
       j = floor(jR);

       A = I(j + 1, i + 1);
       B = I(j + 2, i + 1);
       C = I(j + 2, i + 2);
       D = I(j + 1, i + 2);
       
       di = iR - i;
       dj = jR - j;
       
       nI(jj + 1, ii + 1) = A*(1-di)*(1-dj) + B*dj*(1-di) + C*di*dj + D*(1-dj)*di;
       
       
   end
end

figure(2);
imshow(uint8(nI));
