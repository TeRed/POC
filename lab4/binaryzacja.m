clc;
close all;
clearvars;

I = imread('coins.png');

splitPoint_1 = 94;
splitPoint_2 = graythresh(I) * 255;
splitPoint_3 = entropyYen(I);
splitPoint_4 = clusterKittler(I);

figure;
subplot(3,2,1);
imshow(I);
title('Image');

subplot(3,2,2);
imhist(I);
title('Image hist');

subplot(3,2,3);
imshow( im2bw(I, splitPoint_1 / 255) );
title(['My: ', num2str(splitPoint_1)]);

subplot(3,2,4);
imshow( im2bw(I, splitPoint_2 / 255) );
title(['graythresh: ', num2str(splitPoint_2)]);

subplot(3,2,5);
imshow( im2bw(I, splitPoint_3 / 255) );
title(['entropyYen: ', num2str(splitPoint_3)]);

subplot(3,2,6);
imshow( im2bw(I, splitPoint_4 / 255) );
title(['clusterKittler: ', num2str(splitPoint_4)]);













