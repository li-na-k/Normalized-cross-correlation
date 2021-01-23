function ass6()
  left = imread("left.png"); %gray value intensities are inside the variables
  right = imread("right.png");
  
  double(left); %convert the gray value intensities to float values
  double(right);
  norm_cross_corr(left, right)  
endfunction

function norm_cross_corr(left, right) % must be same size
  max_x = size(left)(1);
  max_y = size(right)(2);
  
  r = 2; %search range (window width and length is 2*r + 1)
  
  for(i = 1+r : max_x-r) % x pixel
    for(j = 1+r : max_y-r) % y pixel
    
      max_correl = 0;
      max_correl_pos = 0; % store search window position of current max_correl
    
      a = left(i-r : i+r, j-r : j+r); % reference_window
      
      % search horizontally
      for(shift = 0 : max_x-i)
        b = right(i-r+shift : i+r+shift, j-r : j+r); % search_window
     
        % calculate NCC 
        c = mean((a-mean(a)).*(b-mean(b))); % covariance of a and b
        va = cov(a,a,1); % variance of a
        vb = cov(b,b,1); % variance of b
        ncc = c / sqrt(va * vb);
        if(ncc > max_correl)
          max_correl = ncc;
          max_correl_pos = i+shift;
        endif
       endfor


    endfor
  endfor
endfunction


