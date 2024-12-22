
function img = rgb_to_gray (filename)
  
  I = imread(filename);
  if (ndims(I) !=3) %an RGB image is a three dimensional matrix
    error ("does not seem to be an RGB image...");
  endif
  %read intensity values from the three rgb channels
  Ired = I(:,:,1);
  Iblue = I(:,:,2);
  Igreen = I(:,:,3);
  img = 0.298936*Ired+0.587043*Iblue+0.114021*Igreen+0.5; %compute the grayscale intensity for a pixel combining its values from the three rgb channels in the original image
  
endfunction