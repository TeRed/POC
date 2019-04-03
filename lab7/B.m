close all;
clearvars;
clc;

I = imread('src/fingerprint.bmp');

figure(1);
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(bwmorph(I, 'thin'));
subplot(2,2,3);
imshow(bwmorph(I, 'thin', 2));
subplot(2,2,4);
imshow(bwmorph(I, 'thin', Inf));

%%

I = imread('src/kosc.bmp');

figure(2);
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(bwmorph(I, 'skel', Inf));

%%

I = imread('src/text.bmp');
Out = imopen(I, ones(51,1));
Out2 = imreconstruct(imerode(I, ones(51,1)), I);

figure(3);
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
imshow(Out);
subplot(3,1,3);
imshow(Out2);

figure(4);
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
imshow(imfill(I, 'holes'));
subplot(3,1,3);
imshow(imclearborder(I));









