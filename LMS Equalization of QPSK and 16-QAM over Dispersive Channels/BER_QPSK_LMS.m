function [BER] = BER_QPSK_LMS(SNRs, u, Fc, Fs, rrc, K, m, I_QPSK_LMS_novo, Q_QPSK_LMS_novo, d, eta, bitstream)

    for n = 1:length(SNRs)
        SNR = SNRs(n);
    
        % Adicionar ruído AWGN
        sinal_awgn = awgn(u, SNR, 'measured');
    
        [I_d,Q_d] = demodulador(sinal_awgn, Fc, Fs, rrc, K, m);
    
        [W, ~] = LMS(I_d, Q_d, I_QPSK_LMS_novo, Q_QPSK_LMS_novo, d, eta);
    
        IQ_LMS = I_d + 1i*Q_d;
        outA = filter(W, 1, IQ_LMS);
    
        demapper_qpsk = qpsk_demapper(real(outA), imag(outA));
    
        BER(n)= sum(xor(bitstream,demapper_qpsk))/length(bitstream);
    end
end