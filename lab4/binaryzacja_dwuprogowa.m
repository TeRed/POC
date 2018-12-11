clc;
close all;
clearvars;

I = imread('src/bart.bmp');

IB = I > 191 & I < 207;
IB = uint8(IB);

figure;
subplot(3,1,1);
imshow(I);
title('Image');

subplot(3,1,2);
imhist(I);
title('Image hist');

subplot(3,1,3);
imshow(IB, []);
title('Image binary');