clearvars;
close all;
clc;

load('MR_data.mat');



figure;
subplot(1,3,1);
imshow(uint8(I_noisy2));
subplot(1,3,2);
imshow(convolution(I_noisy2, [3,3]), []);
subplot(1,3,3);
imshow(bilateralna(I_noisy2, [3,3]), []);