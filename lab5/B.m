close all;
clearvars;
clc;

I = imread('src/lenaSzum.bmp');

%%
I_Filter = medfilt2(I);

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter);
subplot(1,3,3);
imshow(imabsdiff(I,I_Filter),[]);

%%
I = imread('src/lena.bmp');

I_Filter_a = uint8(conv2(I,fspecial('average'),'same'));
I_Filter_m = medfilt2(I);

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter_m);
title('med');
subplot(1,3,3);
imshow(I_Filter_a);
title('average');

%% 

I_Poster = imread('src/lena.bmp');

for i=1:10
    I_Poster = medfilt2(I_Poster,[5,5]);
end

figure;
imshow(I_Poster);
title('Poster');



