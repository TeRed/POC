close all;
clearvars;
clc;

I = imread('src/moon.bmp');

%%
M = [0,1,0;1,-4,1;0,1,0];

M = M / 9;

I_Filter = conv2(I,M,'same');

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter + 128, []);
subplot(1,3,3);
imshow(abs(I_Filter), []);

%%

M = fspecial('laplacian');
I_Conv = uint8(conv2(I,M,'same'));
I_Filter = imabsdiff(I,I_Conv);

figure;
subplot(1,2,1);
imshow(I);
title('oryginalny');
subplot(1,2,2);
imshow(I_Filter);
title('laplacian diff');

