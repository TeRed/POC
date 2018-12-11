function data_filtered = bilateralna(data_, local_window_)
    FUNCTION = @(data_, local_wndow_)bilateralna_local(data_, local_window_);
    
    data_filtered = colfilt(data_, local_window_, 'sliding', FUNCTION, local_window_);
end