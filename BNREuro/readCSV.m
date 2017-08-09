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
## @deftypefn {Function File} {@var{retval} =} readCSV (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mhcrnl <mhcrnl@MHCRNL-PC>
## Created: 2017-08-08
pwd
clear; clc;
## Read csv file
filename = "export.csv";
#s = load (filename); 
#rdata = fopen(filename)
#A = fscanf(rdata, "%s")

#fclose(rdata)
#M = dlmread(filename, " ;,")
#printf("%s", M)
string_data = fileread(filename);
##
# Inlocuirea virgulei cu punct
string_data(string_data==",") ="."
cellArray = ostrsplit(string_data,";\t\n")
x = [cellArray{1:2:25}]
y = [cellArray{2:2:25}]
#plot(cellArray{1:2:25},cellArray{2:2:25})
#plot(y')
#function [retval] = readCSV (input1, input2)

#endfunction
