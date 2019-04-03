clearvars;
close all;
clc;

L = imread('src/lenaRGB.bmp');

lR = L(:,:,1);
lG = L(:,:,2);
lB = L(:,:,3);

figure;
subplot(3,1,1);
title('Lena R');
imshow(lR);

subplot(3,1,2);
title('Lena G');
imshow(lG);

subplot(3,1,3);
title('Lena B');
imshow(lR);

lR_E = histeq(lR, 256);
lG_E = histeq(lG, 256);
lB_E = histeq(lB, 256);

L_E = L;
L_E(:,:,1) = lR_E;
L_E(:,:,2) = lG_E;
L_E(:,:,3) = lB_E;

figure;
imshow(L_E);

%%

hsvL = rgb2hsv(L);

hsvL(:,:,3) = histeq(hsvL(:,:,3), 256);

figure;
imshow(hsv2rgb(hsvL));


