N1 = 12;
N2 = 25;
L1 = N1*5;
L2 = N2*5;
n0 = N1+L1+1;
hhat = randn(1,38);
hhat = hhat+.01;


for i = 1:186
    H0(i:i+length(hhat)-1,i) = hhat.';    
end

R_hzf = H0'*H0;
R_hzf = R_hzf/R_hzf(1,1);

for i = 1:186
    G(i:i+length(hhat)-1,i) = fliplr(hhat);    
end
G = G(1:186,1:186);
R_hmmse = G*G';
R_hmmse = R_hmmse/R_hmmse(1,1);