clearvars;
close all;
clc;

lena512 = imread('lena.bmp');
lena256 = imresize(lena512, [256,256]);
lena128 = imresize(lena512, [128,128]);
lena64 = imresize(lena512, [64,64]);

figure;
imshow(lena512);

figure;
imshow(lena256, 'InitialMagnification', 200);

figure;
imshow(lena128, 'InitialMagnification', 400);

figure;
imshow(lena64, 'InitialMagnification', 800);