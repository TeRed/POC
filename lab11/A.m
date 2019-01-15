clc;
clearvars;
close all;

I = imread('src/ccl1.png');

figure;
imshow(I);

[YY, XX] = size(I);

L = 1;
N = 100;
id = 1:N;

for i = 2:YY
   for j = 2:(XX-1)
       if (I(i,j) ~= 0)
          sasiedzi = [I(i-1,j-1) I(i-1,j) I(i-1,j+1) I(i,j-1)];
          
          suma = sum(sasiedzi);
          
          if suma == 0
             I(i,j) = L;
             L = L + 1;
          else
              sasiedzi = nonzeros(sasiedzi);
              minimum = min(sasiedzi);
              maksimum = max(sasiedzi);
              
              if minimum == maksimum
                  I(i,j) = minimum;
              else
                  id = union(minimum, maksimum, id);
                  I(i,j) = minimum;
              end
          end
       end
   end
end

figure;
imshow(label2rgb(I));

for i = 1:N
    lut(i) = root(i,id);
end

for i = 1:YY
   for j = 1:XX
        if(I(i,j) > 0)
             I(i,j) = lut(I(i,j));      
        end
   end
end

figure;
imshow(I,[]);

function index = root(index, id)
    while id(index) ~= index
        index = id(index);        
    end
end

function id = union(p,q, id)
    id(root(p,id)) = root(q,id);
end