clc;
clearvars;
close all;

I = imread('src/shapes.png');

labeled = bwlabel(I,4);

wsp = obliczWspolczynniki(labeled);

[YY, XX] = size(labeled);

cross = labeled;
for i = 1:YY
   for j = 1:XX
       piksel = cross(i,j);
       if (piksel ~= 0 && (wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66))
            cross(i,j) = 0;
       end
   end
end

figure;
imshow(cross, []);

% ============================

I = imread('src/shapesReal.png');

I = imerode(imcomplement(im2bw(I, 0.25)), strel('rectangle', [5 5]));

labeled = bwlabel(I,4);

figure;
imshow(labeled, []);

wsp = obliczWspolczynniki(labeled);

[YY, XX] = size(labeled);

cross = labeled;
for i = 1:YY
   for j = 1:XX
       piksel = cross(i,j);
       if (piksel ~= 0 && ~(wsp(piksel,2) > 0.55 && wsp(piksel,2) < 0.66))
           cross(i,j) = 0;
       end
   end
end

figure;
imshow(cross, []);