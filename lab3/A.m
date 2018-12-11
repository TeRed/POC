clearvars;
close all;
clc;

%% 1 - 2

L1 = imread('src/lena1.bmp');
L2 = imread('src/lena2.bmp');
L3 = imread('src/lena3.bmp');
L4 = imread('src/lena4.bmp');

figure;
subplot(4,2,1); imshow(L1);
subplot(4,2,2); imhist(L1, 256);
subplot(4,2,3); imshow(L2);
subplot(4,2,4); imhist(L2, 256);
subplot(4,2,5); imshow(L3);
subplot(4,2,6); imhist(L3, 256);
subplot(4,2,7); imshow(L4);
subplot(4,2,8); imhist(L4, 256);

%% 3

Hist1 = imread('src/hist1.bmp');

figure;
subplot(2,1,1); imshow(Hist1);
subplot(2,1,2); imhist(Hist1);

%% 4 - 5

AdjHist1 = imadjust(Hist1);

figure;
subplot(2,1,1); imshow(AdjHist1);
subplot(2,1,2); imhist(AdjHist1);

%% 6 - 9

[H, x] = imhist(Hist1);

C = cumsum(H);
C2 = C/(max(C) / max(H));

figure;
hold on;
plot(x, H);
plot(x, C2)
hold off;

%% 10 - 11

Lut = 1:256;

for i = 1:256
   Lut(i) = (C2(i) / C2(256)) * 256; 
end

HistLut = intlut(Hist1, uint8(Lut));

figure;
subplot(3,1,1); imshow(HistLut);
subplot(3,1,2); imhist(HistLut);
subplot(3,1,2);

[H, x] = imhist(HistLut);

C = cumsum(H);
C2 = C/(max(C) / max(H));

hold on;
plot(x, H);
plot(x, C2)
hold off;

%% 12 - 15

figure;
imshow(histeq(Hist1, 256));

H = imread('src/hist2.bmp');
figure;
subplot(4,1,1);
imshow(H);
subplot(4,1,2);
imshow(imadjust(H));
subplot(4,1,3);
imshow(histeq(H));
subplot(4,1,4);
imshow(adapthisteq(H));

H = imread('src/hist3.bmp');
figure;
subplot(4,1,1);
imshow(H);
subplot(4,1,2);
imshow(imadjust(H));
subplot(4,1,3);
imshow(histeq(H));
subplot(4,1,4);
imshow(adapthisteq(H));

H = imread('src/hist4.bmp');
figure;
subplot(4,1,1);
imshow(H);
subplot(4,1,2);
imshow(imadjust(H));
subplot(4,1,3);
imshow(histeq(H));
subplot(4,1,4);
imshow(adapthisteq(H));









