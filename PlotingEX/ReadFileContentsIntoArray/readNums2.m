## Copyright (C) 2017 mhcrnl
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
## @deftypefn {Function File} {@var{retval} =} readNums2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mhcrnl <mhcrnl@MHCRNL-PC>
## Created: 2017-08-09
fileId = fopen('nums2.txt', 'r');
formatSpec = '%d %f';
sizeA =[2, inf];
A =  fscanf(fileId, formatSpec, sizeA)
fclose(fileId);
plot(A)
function [retval] = readNums2 (input1, input2)

endfunction