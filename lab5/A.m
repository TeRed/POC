close all;
clearvars;
clc;

I = imread('src/plansza.bmp');

M = fspecial('average');

I_Filter = uint8(conv2(I,M,'same'));

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter);
subplot(1,3,3);
imshow(imabsdiff(I,I_Filter),[]);

%%
window = [1,3,5,9,15,35];

figure;
for w=1:6
    M = fspecial('average',window(w));
    subplot(2,3,w);
    imshow(uint8(conv2(I,M,'same')));
    title(num2str(window(w)));
end

%%
M = [1 2 1; 2 4 2; 1 2 1];

M = M / sum(sum(M));

I_Filter = uint8(conv2(I,M,'same'));

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(I_Filter);
subplot(1,3,3);
imshow(imabsdiff(I,I_Filter), []);

%%

M = fspecial('gaussian',5,0.5);

I_Filter = uint8(conv2(I,M,'same'));

figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imshow(I_Filter);
subplot(2,2,3);
imshow(imabsdiff(I,I_Filter),[]);
subplot(2,2,4);
mesh(M);





