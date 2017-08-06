a = [1,2; 3,4];
a = [56,3; 2,3];
printf("Fila: matrice.m");
#a.sizemax();
gethostname()
s=urlread("https://raw.githubusercontent.com/schneems/Octave/master/mlclass-ex1/ex1.m");

#filename="ex1.m";
#fid =fopen(filename, "w");
#fputs(fid, s);

#fclose(fid);

cuvant=input("Alegeti un cuvant pentru cautare: ", "s")

findstr(s, cuvant,0)

function searchInSite(url)
  if(nargin != 1)
    usage("url = string/Functia accepta un string de tip URL ca argument.");
  endif
  if(ischar(url))
    site = urlread(url); 
    cuvant2 = input("Alegeti un cuvant de cautat: ","s");
    findstr(site, cuvant2, 0)
  else 
    error("url = Astepta o valoare de tip string")
  endif
endfunction

searchInSite("http://evz.ro/");

searchInSite()