# Functii si scripturi in OCTAVE

Crearea filelelor s-a facut cu comanda:
``` M
edit file_name.
```
## salut.m
``` octave
##
# Initializare
clear all; close all; clc
##
# Functia afiseaza un mesaj in consola
function salut
  printf("Salut OCTAVE!\n")
endfunction
```
## salut1.m
``` octave
# Initializare
clear all; close all; clc
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

```