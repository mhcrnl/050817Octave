# Crearea unui vector 
v = -10:0.1:10;
save data.dat v
m = load ("data.dat");
plot(m, sin(m));

