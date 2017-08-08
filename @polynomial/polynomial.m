## -*- texinfo -*-
## @deftypefn  {} {} polynomial ()
## @deftypefnx {} {} polynomial (@var{a})
## Create a polynomial object representing the polynomial
##
## @example
## a0 + a1 * x + a2 * x^2 + @dots{} + an * x^n
## @end example
##
## @noindent
## from a vector of coefficients [a0 a1 a2 @dots{} an].
## @end deftypefn

##
# <include>polynomial.m</include>

function p = polynomial (a)

  if (nargin > 1)
    print_usage ();
  endif

  if (nargin == 0)
    p.poly = [0];
    p = class (p, "polynomial");
  else
    if (strcmp (class (a), "polynomial"))
      p = a;
    elseif (isreal (a) && isvector (a))
      p.poly = a(:).';  # force row vector
      p = class (p, "polynomial");
    else
      error ("@polynomial: A must be a real vector");
    endif
  endif

endfunction

function display (p)

  printf ("%s =", inputname (1));

  a = p.poly;
  first = true;
  for i = 1 : length (a);
    if (a(i) != 0)
      if (first)
        first = false;
      elseif (a(i) > 0 || isnan (a(i)))
        printf (" +");
      endif
      if (a(i) < 0)
        printf (" -");
      endif
      if (i == 1)
        printf (" %.5g", abs (a(i)));
      elseif (abs (a(i)) != 1)
        printf (" %.5g *", abs (a(i)));
      endif
      if (i > 1)
        printf (" X");
      endif
      if (i > 2)
        printf (" ^ %d", i - 1);
      endif
    endif
  endfor

  if (first)
    printf (" 0");
  endif
  printf ("\n");

endfunction