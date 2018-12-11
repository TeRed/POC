clearvars;
close all;
clc;

L = imread('lena.bmp');

L = imresize(L, [128,128]);

figure;
subplot(6,1,1);
imshow(L);
subplot(6,1,2);
imshow(imadjust(L, [0, 1], [0 31/255]), []);
subplot(6,1,3);
imshow(imadjust(L, [0, 1], [0 15/255]), []);
subplot(6,1,4);
imshow(imadjust(L, [0, 1], [0 7/255]), []);
subplot(6,1,5);
imshow(imadjust(L, [0, 1], [0 3/255]), []);
subplot(6,1,6);
imshow(imadjust(L, [0, 1], [0 1/255]), []);
