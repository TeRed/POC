clearvars;
close all;
clc;

O = imread('kolo.bmp');
K = imread('kwadrat.bmp');

figure;
imshow(O);
title('Kolo');

figure;
imshow(K);
title('Kwadrat');

figure;
imshow(not(O));
title('not Kolo');

figure;
imshow(not(K));
title('not Kwadrat');

figure;
imshow(and(O, K));
title('Kolo and Kwadrat');

figure;
imshow(or(O, K));
title('Kolo or Kwadrat');

figure;
imshow(xor(O, K));
title('Kolo xor Kwadrat');

