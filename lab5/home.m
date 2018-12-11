clearvars;
close all;
clc;

I = imread('src/plytkaSzumImp.bmp');

IK = I;

IM = medfilt2(I, [7, 7]);

[Y,X] = size(I);

WM = 7;
WS = 3;

for x = 4:(X-3)
    for y = 4:(Y-3)
        WC = WS;
        while WC < WM
            Move = floor((WC - 1) / 2);
            A = double(I((y-Move):(y+Move),(x-Move):(x+Move)));
            
            zmin = min(A(:));
            zmax = max(A(:));
            zmed = median(A(:));
            
            A1 = zmed - zmin;
            A2 = zmed - zmax;
            
            if A1 > 0 && A2 < 0
                break;
            end
            WC = WC + 1;
        end
        
        B1 = double(I(y,x)) - zmin;
        B2 = double(I(y,x)) - zmax;
        
        if B1 > 0 && B2 < 0
            IK(y,x) = I(y,x);
        else
            IK(y,x) = uint8(zmed);
        end
    end
end

figure;
subplot(1,3,1);
imshow(I);
title('Oryginalna');
subplot(1,3,2);
imshow(IM);
title('Medianowa');
subplot(1,3,3);
imshow(IK);
title('Adaptacyjna medianowa')