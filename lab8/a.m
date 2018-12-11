close all;
clearvars;
clc;

Im = imread('src/dom.png');

figure;
subplot(2,2,1);
imshow(Im);
subplot(2,2,2);
imshow(edge(Im, 'log'));
title('log');
subplot(2,2,3);
imshow(edge(Im, 'canny'));
title('canny');
subplot(2,2,4);
imshow(edge(Im, 'sobel'));
title('sobel');

figure;
subplot(2,2,1);
imshow(Im);
subplot(2,2,2);
imshow(edge(Im, 'log', 0.009));
title('log');
subplot(2,2,3);
imshow(edge(Im, 'canny', [0.15 0.2]));
title('canny');
subplot(2,2,4);
imshow(edge(Im, 'sobel', 0.13));
title('sobel');
