#! /bin/octave -qf
# un simplu program Octave
printf("Salut!");
printf("%s", program_name());
# 14.2.1 Opening and Closing Files
filename = "fila.txt";
fid = fopen(filename, "w");
# Aici operatii asupra filei
fputs(fid, "Software-ul open source este necesar."); 
fclose(fid);

# Read from file
fidr = fopen(filename);
txt = fgetl(fidr);
printf("%s", txt);
fclose(fidr);

function afisare
  printf("\a");
  printf("Functia afisare().");
endfunction

afisare

randn("state", 1);
hist(randn(10000,1),30);
xlabel("Value");
ylabel("Count");
title("Histograma");
figure(1);
Cheese = {"Cheddar", "Swiss", "Camembert", ...
          "Munster", "Stilton", "Blue"};
Sold = [105, 30, 70, 10, 15, 20];
pareto (Sold, Cheese);
figure(2);
[th, r] = rose ([2*randn(1e5,1), pi + 2*randn(1e5,1)]);
polar (th, r);