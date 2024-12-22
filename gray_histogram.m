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
## @deftypefn {Function File} {@var{retval} =} histogram (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eddybudge <eddybudge@laptop>
## Created: 2020-04-22

#compute histogram of a grayscale image and return the array with histogram info
function gray_histogram_info = gray_histogram (img)

  if (ndims(img) !=2) %verify that we deal with a bidimensional matrix (an rgb image is three-dimensional instead)
    error ("smells like an RGB image...");
  endif
  
  gray_histogram_info = zeros(1,256); %create an array where we are going to store the count of the pixels having a specified intensity value
  width = columns(img);
  height = rows(img);
  for x = 1:height
    for y = 1:width
      intensity = img(x,y);
      gray_histogram_info(1,intensity+1) += 1; %we can't have an index <0> in Octave,so we save the count of pixels of intensity i inside our array at index i+1
    endfor
  endfor
  #plot(0:255,gray_histogram_info,'m')
endfunction
