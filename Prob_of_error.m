clc
clear
close all

SNR = 0:0.01:9; % Eb/No in DB
SNR1 = 10.^(SNR/10);

BASK_Pe = 0.5*erfc(sqrt(SNR1/4));
BFSK_Pe = 0.5*erfc(sqrt(SNR1/2));
BPSK_Pe = 0.5*erfc(sqrt(SNR1));
QPSK_Pe = erfc(sqrt(SNR1));

semilogy(SNR,BASK_Pe,SNR,BFSK_Pe,SNR,BPSK_Pe,SNR,QPSK_Pe);
legend('BASK Pe','BFSK Pe','BPSK Pe','QPSK Pe')