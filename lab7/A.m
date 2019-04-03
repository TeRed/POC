close all;
clearvars;
clc;

%%

I = imread('src/ertka.bmp');

Out = imerode(I, strel('square', 3));
Out = imerode(Out, strel('square', 3));
Out = imerode(Out, strel('square', 3));

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);

%%

I = imread('src/buzka.bmp');

Out = imerode(I, [1,0,1;0,1,0;1,0,1]);

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);

%%

I = imread('src/ertka.bmp');

Out = imdilate(I, strel('square',3));

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);

%%

I = imread('src/ertka.bmp');
M = strel('square',3);

figure;
subplot(2,3,1);
imshow(I);
subplot(2,3,2);
imshow(I);
subplot(2,3,3);
imshow(imerode(I, M));
subplot(2,3,4);
imshow(imdilate(I, M));
subplot(2,3,5);
imshow(imopen(I, M));
subplot(2,3,6);
imshow(imclose(I, M));

Out = imdilate(I, strel('square',2));
Out = imerode(Out, strel('square',3));

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);

%%

I = imread('src/hom.bmp');
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

Out = bwhitmiss(I, SE1, SE2);

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);



