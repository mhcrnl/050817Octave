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
## @deftypefn {Function File} {@var{retval} =} phonebook (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Mihai C <mhcrnl@localhost.localdomain>
## Created: 2017-08-05

function runProgram
  switch(x)
    case 1
      phonebook();
     case 2
     
     otherwise
      comand()
endfunction


function phonebook
  nume = input("Introduceti numele: ", "s")
  prenume = input("Introduceti prenumele:", "s")
  nume_int = numeIntreg(nume, prenume)
endfunction

function [nume_intreg] = numeIntreg(nume1, prenume)
  nume_intreg = "";
  if(nargin != 2)
    usage("2 argumente de tip string");
  endif
  nume_intreg=[nume1, " ", prenume]
endfunction

phonebook