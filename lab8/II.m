close all;
clearvars;
clc;

I = zeros(11, 11);

I(5,4) = 1;

[H, ~, ~] = hough(I,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
title('Hough');
imshow(H, []);

I(1,1) = 1;

[H, ~, ~] = hough(I,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
title('Hough 2');
imshow(H, []);

I(3,4) = 1;
I(10,10) = 1;

[H, theta, rho] = hough(I,'RhoResolution',0.1,'ThetaResolution',0.5);

figure;
title('Hough 2');
imshow(H, []);

th = theta(91);
ro = rho(142);

x=0:0.1:10;
y = ((ro - x*cosd(th))) / sind(th);

figure;
imshow(I);
hold on;
plot(x + 1, y + 1);











