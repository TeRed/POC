clearvars;
close all;
clc;

I = imread('src/lena.bmp');

Y = fftshift(fft2(I));

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

[f1, f2] = freqspace(512, 'meshgrid');

Hd = ones(512);

r = sqrt(f1.^2 + f2.^2);

Hd(r>0.1) = 0;

figure;
colormap(jet(64));
mesh(f1,f2,Hd);

Y = Y .* Hd;

figure;
imshow(Y);

h = fwind1(Hd, hanning(21));
[H f1 f2] = freqz2(h, 512, 512);

figure;
mesh(f1, f2, H);

M = fspecial('gaussian', 512, 100);

figure;
imshow(mat2gray(M));

IF = fftshift(fft2(imread('src/lena.bmp')));
IF = IF .* M;
IF = ifft2(ifftshift(IF));

figure;
imshow(IF, []);






