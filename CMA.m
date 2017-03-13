c_CMA = c_MMSE;
for i = 1:its
yy = conv(r,c_CMA);
y = yy(L1+1:end-L2); % trim yy
z = 2*(y.*conj(y)-1).*y;
Z = fft(z,Nfft);
R = fft(conj(r(end:-1:1)),Nfft)
b = ifft(Z.*R);
delJ = b(Lpkt-L1:Lpkt+L2);
c_CMA1 = c_CMA -mu*delJ;
c_CMA = c_CMA1;
end
yy = conv(r,c_CMA);
y = yy(L1+1:end-L2); % trim yy
