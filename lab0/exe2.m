lena = imread('lena_gray.bmp');

[o, c] = gray2ind(lena, 256);

figure(1);
imshow(o, c);

map = colormap('spring');

figure(2);
imshow(o, map);
