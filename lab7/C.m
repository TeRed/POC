close all;
clearvars;
clc;

I = imread('src/ferrari.bmp');
M = strel('square', 3);
IE = imerode(I, M);
ID = imdilate(I, M);

figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(IE);
subplot(2,2,3);
imshow(ID);
subplot(2,2,4);
imshow(imabsdiff(IE, ID));

figure;
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
imshow(imopen(I, M));
subplot(3,1,3);
imshow(imclose(I, M));

figure;
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
imshow(imtophat(I, M));
subplot(3,1,3);
imshow(imbothat(I, M));

I = imread('rice.png');

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(imtophat(I, strel('disk', 10)));









