clear all
clc
load('DetectionFilter.mat')
Nfft = 2^14;
FF = -0.5:1/Nfft:0.5-1/Nfft;

latexWidth =  5;
latexHeight = 4;   

% SRRC stuff
% alpha   = 0.5;
N       = 2;
% span    = 12;

% % lets make c a multiple of N+1
% if(mod(length(c)-1,N) ~= 0)
%     c = [c; zeros(N-mod(length(c)-1,N),1)];
% end

% % QPSK filter stuff
% M = 4;
g = DetectionFilter;     % pulse shape
% h = conv(g,c);                      % channel applied to pulse shape
% x = conv(conj(h(end:-1:1)),h);      % temporal autocorrelation of channel
% xn = x(1:N:end);                    % sampled x

%%% (a)
figure(1); clf
% subplot(211) %g
myAx = -(length(g)-1)/2:(length(g)-1)/2;
stem(myAx/N,g,'k'); grid on
xlabel('t/T')
% subplot(212) %g
% plot(FF,10*log10(fftshift(abs(fft(g,Nfft).^2)))); grid on
% xlabel('cycles/sample')

marge = axis;
% axis([1 381 marge(3:4)])
ax = gca;
% legend('Time Domain','Frequency Domain','Location', 'NorthWest')
% % title(['Convolution with Filter Length ' num2str(L)])
% xlabel('filter length')
ylabel('$\textbf{d}$','Interpreter','latex')

ax.FontName = 'Times New Roman';

ff = gcf;
homer = ff.Units;
ff.Units = 'inches';
bart = ff.Position;
ff.Position = [bart(1:2) latexWidth latexHeight];
ff.PaperPositionMode = 'auto';
ff.Units = homer;
drawnow
print(ff, '-dpng', ['df']) %save as eps a 

