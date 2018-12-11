close all;
clearvars;
clc;

load('src/maskiPP');
I = imread('src/jet.bmp');
s(I,P1);
s(I,P2);
s(I,R1);
s(I,R2);
s(I,S1);
s(I,S2);



I_Filter = sqrt(conv2(I,S1,'same').^2 + conv2(I,S2,'same').^2);

I_Filter_2 = (abs(conv2(I,S1,'same')) + abs(conv2(I,S2,'same')));

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter, []);
subplot(1,3,3);
imshow(I_Filter_2, []);

function s(I,M)
    I_Filter = conv2(I,M,'same');

    figure;
    subplot(1,3,1);
    imshow(I);
    subplot(1,3,2);
    imshow(I_Filter + 128, []);
    title('+128');
    subplot(1,3,3);
    imshow(abs(I_Filter), []);
    title('abs');
end