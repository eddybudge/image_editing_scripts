## Copyright (C) 2020 eddybudge
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} normalization2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eddybudge <eddybudge@laptop>
## Created: 2020-04-22

function normalization(filename,min,max)
  L=256; %intensity levels
  norm_img = rgb_to_gray(filename); %convert our input rgb image into a grayscale image 
  res = zeros(rows(norm_img),columns(norm_img)); %create a new grayscale image -that will be returned as output- filled with 0: next we are going to turn this zeros into normalized values of the corresponding pixels of the input image
  mask = norm_img<max & norm_img>min; %create a mask to "locate" the pixels inside the original image that belong to the following range: ]min,max[ (we get a matrixed filled with 0 and 1, where 1 tells us that the pixel in that position is inside the range we specified) 
  res += norm_img.*mask; %sum to the image filled with zeros, the input image that we "masked"
  res -= min*mask; %subtract from the masked input image <min>
  res *= (L-1)/(max-min);% multiply the previous result by (L-1)/(max-min): as we deal with a matrix of uint8, we lose information if we are performing computations that do not fit in the range [0,255] - so it's better to avoid going outside this range
  res(norm_img>=max)=255; %set to 255 the pixels in the output image that are greater than <max> inside the input image
  visualize_gray_image_and_histogram(res); %compute a histogram and visualize both the normalized image and its histogram
  
endfunction
