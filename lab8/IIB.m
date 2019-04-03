close all;
clearvars;
clc;

I = imread('src/kwadraty.png');

[H, theta, rho] = hough(edge(I, 'canny'));

Max = houghpeaks(H, 8, 'Threshold', 0.82*max(H(:)), 'NHoodSize', [55 55]);

figure;
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(edge(I, 'canny'));
subplot(1,3,3);
imshow(H, []);
hold on;
plot(Max(:,2), Max(:,1), 'o');

lines = houghlines(I,theta,rho,Max,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end


