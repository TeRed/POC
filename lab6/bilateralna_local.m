function data_filtered = bilateralna_local(data, local_window)
    Nx = size(data, 2);
    ro = 25;
    
    h = fspecial('gaussian', local_window, 25);
    
    for i=1:Nx
       patch = reshape(data(:, i), local_window);
       
       [rows, cols] = find(patch == patch);
       rows = reshape(rows, local_window);
       cols = reshape(cols, local_window);
       Ncy = ceil(local_window(1)/2);
       Ncx = ceil(local_window(2)/2);
       dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
       abs_diff = patch - patch(Ncx, Ncy) ;
       gamma = exp(-(abs_diff.^2)/(2*ro*ro));
       h = exp(-(dist.^2)/(2*ro*ro));
       
       data_filtered(i) = sum(sum(patch .* gamma .* h)) / sum(sum(gamma .* h));
    end
end

