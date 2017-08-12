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
## @deftypefn {Function File} {@var{retval} =} readTxt (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mhcrnl <mhcrnl@MHCRNL-PC>
## Created: 2017-08-09
filename = "export01.txt";
#sizeA = [2, inf];
fileId= fopen(filename);
tline = fgetl(fileId);
while ischar(tline)
  disp(tline)
  tline = fgetl(fileId)
end
#A = fscanf(fileId, "%s %f", [2,25]);

fclose(fileId);
function [retval] = readTxt (input1, input2)

endfunction
