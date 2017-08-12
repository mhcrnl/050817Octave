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
## @deftypefn {Function File} {@var{retval} =} readCSV2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mhcrnl <mhcrnl@MHCRNL-PC>
## Created: 2017-08-09
filename = "export.csv"
str_data = fileread(filename);
str_data(str_data == ",") = ".";

fileId = fopen("export.txt", "w");
fprintf(fileId, "%s %f\n", str_data);
fclose(fileId);

function [retval] = readCSV2 (input1, input2)

endfunction
