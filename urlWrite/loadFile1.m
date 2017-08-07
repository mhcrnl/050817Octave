## Copyright (C) 2017 Mihai C
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
## @deftypefn {Function File} {@var{retval} =} loadFile1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mihai C <mhcrnl@localhost.localdomain>
## Created: 2017-08-06

clear all; clc;

function loadFile1 (url, file)
  if(nargin != 2)
    usage("url=string, file=string");
   endif
   if(ischar(url) != 0)
    error("Tipul de date pt url trebuie sa fie string");
   endif
  urlwrite(url, file);

endfunction

loadFile1( file);
