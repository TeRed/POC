close all;
clearvars;
clc;

I = imread('src/knee.png');

figure;
imshow(I);

I = double(I);

% [X, Y] = ginput(1);
% 
% X = floor(X);
% Y = floor(Y);

X = 200;
Y = 350;

[size_x, size_y] = size(I);

visited = zeros(size_x, size_y);
segmented = zeros(size_x, size_y);

stack = zeros(10000, 2);
iStack = 1;

stack(iStack, 1) = X;
stack(iStack, 2) = Y;
iStack = iStack + 1;

visited(X, Y) = 1;
segmented(X, Y) = 1;

nS = 0;
mV = 0;

while iStack > 1
    iStack = iStack - 1;
    X = stack(iStack, 1);
    Y = stack(iStack, 2);
    nS = nS + 1;
    
    if X == 1 || Y == 1 || X == size_x || Y == size_y
        continue;
    end
    
    neighbours = [X+1, Y+1; X+1, Y; X+1, Y-1; X, Y+1; X, Y-1; X-1, Y+1; X-1, Y; X-1, Y-1];
    
    mV = (mV*(nS - 1) + I(X,Y)) / nS;
    
    for i = 1:8
       nX = neighbours(i, 1);
       nY = neighbours(i, 2);
       
       if(abs(I(nX, nY) - mV) < 35 && visited(nX, nY) == 0)
           segmented(nX, nY) = 1;
           stack(iStack, 1) = nX;
           stack(iStack, 2) = nY;
           iStack = iStack + 1;
       end
       visited(nX, nY) = 1;
    end
    
end

figure;
imshow(segmented, []);










