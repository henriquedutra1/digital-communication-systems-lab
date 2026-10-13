function [I_d,Q_d] = demodulador(u, Fc, Fs, rrc, K, m)
    % heterodinação 
    N = length(u);
    n = 0:N-1;
    carrier_I = cos(2*pi*(Fc/Fs)*n);
    carrier_Q = sin(2*pi*(Fc/Fs)*n);
    Ir = u .* carrier_I;
    Qr = u .* (-carrier_Q);
    
    % Processo de filtragem
    o = conv(rrc,rrc);
    [~,indice] = max(abs(o));

    I_filtrado_r = conv(Ir,rrc);
    I_filtrado_r = I_filtrado_r(indice:end-indice);

    Q_filtrado_r = conv(Qr,rrc);
    Q_filtrado_r = Q_filtrado_r(indice:end-indice);

    % Downsampling
    I_d = downsample(I_filtrado_r,K);
    Q_d = downsample(Q_filtrado_r,K);

    % Ajuste de Ganho
    I_d = I_d/m;
    Q_d = Q_d/m;
end
