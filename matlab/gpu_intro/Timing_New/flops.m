clear all

figure(1); clf
convLength = 1:2^14+1024;
L_m = [186 21];
for loops = 1:2
L = L_m(loops);
N = convLength-L+1;
numFLOPSperConvOutput = 7*L; % (4 multiplies, 2 adds)*L + L(1 add for the summation)

convFlops = convLength.*numFLOPSperConvOutput;

fftFlops = 0*convFlops;
for i = 1:length(N)
    Nfft = 2^nextpow2(L+N(i)-1);
    fftFlops(i) = 5*Nfft*log2(Nfft) + 5*Nfft*log2(Nfft) + 6*Nfft + 5*Nfft*log2(Nfft);
end




latexWidth = 5;
latexHeight = 4;
figure(loops)
plot(N,convFlops, N,fftFlops); grid on
marge = axis;
marge = axis;
axis([0 16497 marge(3:4)])
ax = gca;
legend('Time Domain','Frequency Domain','Location', 'NorthWest')
% title(['Convolution with Filter Length ' num2str(L)])
xlabel('signal length')
ylabel('flops')
ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
drawnow
print(ff, '-depsc', ['Theory' num2str(L) 'Tap_flops']) %save as eps a 
end



