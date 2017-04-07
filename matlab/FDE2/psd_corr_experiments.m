%%% psd_corr_experiments

N = 2;
max_lag = 100;
Nfft = 1024;
FF = -0.5:1/Nfft:0.5-1/Nfft;

ss = SOQPSK_modulator(10,randi([0 1],1000000,1));
ss2 = ss(1:5:end);

R = xcorr(ss2,max_lag,'unbiased');
SS2 = fft(R(101-100:101+100),Nfft);

SS = pwelch(ss2,blackman(Nfft),0.5*Nfft,Nfft,'two-sided');


figure(1); clf;
plot(FF*N,10*log10(fftshift(SS/max(SS))),'k');
grid on;
xlabel('frequency (cycles/bit)');
ylabel('magnitude (dB)');
axis([-1 1 -50 0]);

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
% legend('SOQPSK-TG Power Spectrum','Location','Best')
print(ff, '-depsc', ['FDE2_spectrum_PSI']) %save as eps a 

% figure(11);
% stem(-max_lag:max_lag,abs(R));
% grid on;