close all;
clearvars;
clc;

I = imread('src/calculator.bmp');

% Out = imopen(I, ones(1,71));
Out = imreconstruct(imerode(I, ones(1,71)), I);

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Out);

Out = imabsdiff(I, Out);
Out_C = Out;

figure;
imshow(Out);
title('diff');

Out = imreconstruct(imerode(Out, ones(1,11)), Out);

figure;
imshow(Out);
title('erode');

Out = imreconstruct(min(imdilate(Out, ones(1,21)), Out_C), Out_C);

figure;
imshow(Out);
title('dilatate');






