#!/bin/octave -qf

b =[4;5;6] #column vectorize
A =[2 4 5;
    1 2 3;
    9 5 6]

  x = A\b
  
  x=-10:0.1:10; # Crearea an evently-spaced vector from -10..10
  y = sin(x);
  plot(x,y);
  title("Grafic 2D");
  xlabel("x");
  ylabel("sin(x)");