function ass6()
  left = imread("left.png"); %gray value intensities are inside the variables
  right = imread("right.png");
  
  double(left); %convert the gray value intensities to float values
  double(right);
  norm_cross_corr(left, right)

  
  
endfunction

function norm_cross_corr(left, right) % must be same size
  max_x = size(left)(1)
  max_y = size(right)(2)
  i = 26; % x axis
  j = 26; % y axis
  r = 25; %search range (window width and length is 2*r)
  step = 5; 
  max_correl = 0;
  max_correl_pos = 0; % store window position of current max_correl
  while (i + r <= max_x)
    reference_window = left(i-r : i+r, j-r : j+r);
    search_window = right(i-r : i+r, j-r : j+r);
    % calculate NCC 
    % if larger than current max_correl replace max_correl and store corresponding max_correl_pos
    i = i + step;
    j = j + step;
  endwhile
  
endfunction


