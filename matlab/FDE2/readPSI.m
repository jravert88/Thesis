fileID = fopen('FreqTestFileFromMatlabPSI_r.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
% whos A
fclose(fileID);
myAxis = -2:4/length(A):2-1/length(A);

figure(1); clf;
plot(myAxis,10*log10((fftshift(A)))-4,'--')
% whos myAxis 


% data_bits = randi([0 1],nfft*2,1);
% % data_bits = data_bits(1:6144);
% ss = SOQPSK_modulator(10,data_bits);
% RR = pwelch(ss,blackman(nfft),nfft/2,nfft,'twosided')*1000000;

load('RR1.mat')
% rr = ifft(RR);
% rr = resample(rr,100,1);
% RR = fft(RR);
hold on
myAxis = -4:8/length(RR):4-1/length(RR);
plot(myAxis,10*log10(fftshift(RR))-65-5)
grid on
hold off

marge = axis;
axis([-2 2 -50 10])

latexWidth = 5;
latexHeight = 4;
ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
xlabel('cycles/bit')
ylabel('Magintude (dB)')
% title('SOQPSK-TG Constellation')
legend('\Psi','SOQPSK Power Spectrum','Location','South')
print(ff, '-depsc', ['file_name']) %save as eps a 

