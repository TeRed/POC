clearvars;
close all;
clc;

J = imread('src/jet.bmp');

J_BBHE = dsihe_bbhe(J, 'BBHE');
J_DSIHE = dsihe_bbhe(J, 'DSIHE');

figure;
subplot(3,2,1);
imshow(J);
title('Original');
subplot(3,2,2);
imhist(J);
title('Original hist');

subplot(3,2,3);
imshow(J_BBHE);
title('BBHE');
subplot(3,2,4); 
imhist(J_BBHE);
title('BBHE hist');

subplot(3,2,5);
imshow(J_DSIHE);
title('DSIHE');
subplot(3,2,6); 
imhist(J_DSIHE);
title('DSIHE hist');

function Image = dsihe_bbhe(Img, opt)
    JH = imhist(Img);
    
    if strcmp(opt, 'DSIHE')
        JC = cumsum(JH);

        [X, Y] = size(Img);

        [~, lm] = min( abs(JC-(X*Y/2)) );
    else
        lm = round(mean(Img(:)));
    end
    
    H1 = JH(1:lm, 1);
    H2 = JH(lm+1:end, 1);

    H1 = H1 / sum(H1);
    H2 = H2 / sum(H2);

    C1 = cumsum(H1);
    C2 = cumsum(H2);

    C1n = (lm) * C1;
    C2n = lm+1 + (255-lm+1)*C2;
    lut = [C1n; C2n];
    
    Image = intlut(Img, uint8(lut));
end
