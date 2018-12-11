function data_filtered = convolution(data_, local_window_)
    FUNCTION = @(data_, local_wndow_)convolution_local(data_, local_window_);
    
    data_filtered = colfilt(data_, local_window_, 'sliding', FUNCTION, local_window_);
end

