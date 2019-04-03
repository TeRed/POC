clearvars;
close all;
clc;

P = imread('src/phobos.bmp');
figure;
imshow(P);

P1 = histeq(P);
figure;
imshow(P1);

%%

load histogramZadany;

figure;
plot(histogramZadany);

P2 = histeq(P, histogramZadany);
figure;
imshow(P2);

%%

P3 = imadjust(P);
figure;
imshow(P3);

P3 = adapthisteq(P);
figure;
imshow(P3);

