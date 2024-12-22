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
## @deftypefn {Function File} {@var{retval} =} visualize_image_and_histogram (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: eddybudge <eddybudge@laptop>
## Created: 2020-04-23

function visualize_gray_image_and_histogram (img)
  figure(1) %the first "window" to show
  imshow(img) %show the image
  gray_histogram_info=gray_histogram(img); %compute histogram
  figure(2) %the second window to show
  bar(0:255,gray_histogram_info,'m') %visualize a barplot of our histogram
  set(gca,'xtick',[0:50:255]) %set xticks - otherwise they overlap if the default setting is used (in our case) 
endfunction
