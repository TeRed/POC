function LUT(obraz, przekodowanie)
    I = imread(obraz);
    
    subplot(2,2,1:2);
    plot(przekodowanie);
    title('Przekodowanie');
    
    subplot(2,2,3);
    imshow(I);
    title('Oryginalny');
    
    subplot(2,2,4);
    imshow(intlut(I, przekodowanie));
    title('Przekodowany');
end

