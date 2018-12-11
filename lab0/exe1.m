%% Cleaning
% Clear vars. console and close all

clearvars;
close all;
clc;

%% Code

jpg = imfinfo('lena.jpg');
bmp = imfinfo('lena.bmp');

jpg_i = imread('lena.jpg');
bmp_i = imread('lena.bmp');
bmp_g = rgb2gray(bmp_i);

figure(1);
imshow(jpg_i);

figure(2);
imshow(bmp_i);

figure(3);
imshow(bmp_g);

imwrite(bmp_g, 'lena_gray.bmp');

figure(4);
colormap gray;
mesh(bmp_g);

figure(5);
plot(bmp_i(10,:));

figure(6);
plot(bmp_i(:,10));


