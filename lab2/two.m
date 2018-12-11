%% Start
clearvars;
close all;
clc;

L = imread('lena.bmp');
J = imread('jet.bmp');

%% Add
sumLJ = imadd(L, J);

figure;
imshow(sumLJ, []);
title('Add');

sumLJ16 = imadd(L, J, 'uint16');

figure;
imshow(sumLJ16, []);
title('Add uint16');

%% Linear
linLJ = imlincomb(-1, L, 1, J, 'uint8');

figure;
imshow(linLJ, []);
title('Linear');

%% Subtract

subLJ = imsubtract(L, J);

figure;
imshow(subLJ, []);
title('Sub');

subLJ = imsubtract(int16(L), int16(J));

figure;
imshow(subLJ, []);
title('Sub16');

subLJ = imabsdiff(L, J);

figure;
imshow(subLJ, []);
title('Abs diff');

%% Multiply

mulLJ = immultiply(L, J);

figure;
imshow(mulLJ, []);
title('Mul diff');

mulL = immultiply(L, 2);

figure;
imshow(mulL, []);
title('Mul const');

kolo = imread('kolo.bmp');
mask = boolean(kolo);

mulL = immultiply(L, mask);

figure;
imshow(mulL, []);
title('Mul mask');

%% Neg

neg = imcomplement(L);

figure;
imshow(neg, []);
title('Neg');




