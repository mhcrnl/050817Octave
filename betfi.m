#! /bin/octave -qf

labels = {'Sif1', 'Sif2','Sif3','Sif4','Sif5','FP'};
val = [24,45,67,23,45,67];
bar(val);
set(gca,'XTick', 1:6, 'XTickLabel', labels);

min(val);
dirname=uigetdir();
s = urlread ("http://www.google.com/search", "get",
            {"query", "octave"});
            
s