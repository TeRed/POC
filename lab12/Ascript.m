clearvars;
close all;
clc;

I = imread('src/dwieFale.bmp');

Y = fft2(I);

figure;
subplot(1,3,1);
imshow(I);

A = abs(Y);
A = log10(A+1);

F = angle(Y .* (A > 0.0001));

subplot(1,3,2);
imshow(A, []);

subplot(1,3,3);
imshow(F, []);





