clc;
clearvars;
close all;

I = imread('src/ccl2.png');

figure;
subplot(1,3,1);
imshow(bwlabel(I,4), []);
title('4');

subplot(1,3,2);
imshow(bwlabel(I,8), []);
title('8');

subplot(1,3,3);
imshow(I, []);
title('Oryginalny');