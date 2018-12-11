clearvars;
close all;
clc;

load funkcjeLUT;

figure;
LUT('lena.bmp', kwadratowa);
figure;
LUT('lena.bmp', log);
figure;
LUT('lena.bmp', odwlog);
figure;
LUT('lena.bmp', odwrotna);
figure;
LUT('lena.bmp', pierwiastkowa);
figure;
LUT('lena.bmp', pila);
figure;
LUT('lena.bmp', wykladnicza);