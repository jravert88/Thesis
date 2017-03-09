
latexWidth = 4;
latexHeight = 3;

uiopen('C:\Users\ecestudent\Dropbox\ThesisGit\Thesis\matlab\gpu_intro\CPUvs4GPU.fig',1)
marge = axis;
axis([1 600 marge(3:4)])
axis tight
drawnow



ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
axis tight

print(ff, '-depsc', ['CPUvsGPU_CPUtoGPU']) %save as eps a 