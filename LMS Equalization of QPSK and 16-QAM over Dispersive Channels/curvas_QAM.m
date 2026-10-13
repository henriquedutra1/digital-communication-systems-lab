function [BER] = curvas_QAM(K, Fc, Fs, u, SNRs, rrc, m, bitstream)

N = length(u);
n = 0:N-1;

% Sinal da portadora 
carrier_I = cos(2*pi*(Fc/Fs)*n);
carrier_Q = sin(2*pi*(Fc/Fs)*n);

BER = zeros(1, length(SNRs));

for i = 1:length(SNRs)
    SNR = SNRs(i);

    % Adicionar ruído AWGN
    sinal_awgn = awgn(u, SNR, 'measured');
    
    % Heterodinação no receptor
    Ir = sinal_awgn .* carrier_I;
    Qr = sinal_awgn .* (-carrier_Q);

    % Filtragem no receptor
    o = conv(rrc,rrc);
    [~,indice] = max(abs(o));

    I_filtrado_r = conv(Ir,rrc);
    I_filtrado_r = I_filtrado_r(indice:end-indice);

    Q_filtrado_r = conv(Qr,rrc);
    Q_filtrado_r = Q_filtrado_r(indice:end-indice);

    % Downsampling
    I_d = downsample(I_filtrado_r,K);
    Q_d = downsample(Q_filtrado_r,K);

    % Controle de ganho
    I_d = I_d/m;
    Q_d = Q_d/m;

    % Demapper 
    demapper_16qam = qam16_demapper(I_d, Q_d);

    % Cálculo da BER
    erro = sum(xor(bitstream, demapper_16qam));
    BER(i) = erro/length(bitstream);
end
end