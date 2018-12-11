clc;
close all;
clearvars;

%Const
W2 = 8;
R = 128;
k = 0.15;

I = imread('rice.png');

[X, Y] = size(I);

IB = I;
IB2 = I;

for i = 1:X
    for j = 1:Y
        mean = meanLT(i,j,W2,I,X,Y);
        stddev = stddevLT(i,j,W2,I,mean,X,Y);
        
        stddevSplit = mean * (1 - k*((stddev/R) - 1));
        
        if I(i,j) > mean
            IB(i,j) = 255;
        else
            IB(i,j) = 0;
        end
        
        if I(i,j) > stddevSplit
            IB2(i,j) = 255;
        else
            IB2(i,j) = 0;
        end
    end
end

figure;
subplot(3,1,1);
imshow(I);
title('Image');

subplot(3,1,2);
imshow(IB);
title('Mean');

subplot(3,1,3);
imshow(IB2);
title('Stddev');
