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
## @deftypefn {Function File} {@var{retval} =} salut1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mihai C <mhcrnl@localhost.localdomain>
## Created: 2017-08-07
##
# Initializare
# clear all; close all; clc
##
# Functia salut1 accepta un argument de tip string.
function salut1 (str_input)
  ##
  # Verificarea prezentei argumentului
  if(nargin != 1)
    print_usage("Functia primeste un argument de tip String.\n")
  endif
  ##
  # Verificarea argumentului functiei
  if(ischar(str_input))
    printf("Salut, %s! Bine ai venit!\n", str_input);
  else
    error("Functia are ca argument un string.\n");
  endif
endfunction
