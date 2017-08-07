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
## @deftypefn {Function File} {@var{retval} =} create_plot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mihai C <mhcrnl@localhost.localdomain>
## Created: 2017-08-07
1; # Script file
##
# Initializare 
clear all; close all; clc

x = -10:0.1:10; # Creaza un vector cu valori de la -10 .. 10
y = sin (x); # Este tot un vector

##
# Functia creaza un plot din doua inputuri, aceasta este evaluate in consola.

function create_plot (input1, input2)

  if(nargin < 2)
    print_usage();
    error("Prea putine argumente cel putin doua sunt necesare.\n");
  endif
  
  plot(input1, input2)
  title("Plot 2D");
  xlabel("X");
  ylabel("sin(x)");
endfunction

#create_plot(x,y);