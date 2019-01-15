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

figure;
subplot(1,2,1);
imshow(I, []);

Y = fftshift(Y);

subplot(1,2,2);
imshow(ifft2(ifftshift(Y)), []);

I1 = imread('src/kolo.bmp');
I2 = imread('src/kwadrat.bmp');
I3 = imread('src/kwadrat45.bmp');
I4 = imread('src/trojkat.bmp');

figure;
subplot(2,4,1);
imshow(I1);
subplot(2,4,2);
imshow(I2);
subplot(2,4,3);
imshow(I3);
subplot(2,4,4);
imshow(I4);

subplot(2,4,5);
imshow(fftshift(fft2(I1)));
subplot(2,4,6);
imshow(fftshift(fft2(I2)));
subplot(2,4,7);
imshow(fftshift(fft2(I3)));
subplot(2,4,8);
imshow(fftshift(fft2(I4)));








