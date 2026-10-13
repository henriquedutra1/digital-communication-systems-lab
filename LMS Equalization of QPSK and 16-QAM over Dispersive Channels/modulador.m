function [u, U, f_MHz_U] = modulador(I, Q, K, lpf, Fc, Fs)

% Upsampling de I e Q
I_upsampled = upsample(I, K);
Q_upsampled = upsample(Q, K);

% Aplicação do LPF às sequências I e Q
I_filtrado = conv(I_upsampled,lpf);
Q_filtrado = conv(Q_upsampled,lpf);

N = length(I_filtrado);
n = 0:N-1;

% Sinal da portadora 
carrier_I = cos(2*pi*(Fc/Fs)*n);
carrier_Q = sin(2*pi*(Fc/Fs)*n);

% Heterodinação 
u = I_filtrado .* carrier_I - Q_filtrado .* carrier_Q;

U = fft(u);
U = U(1:(length(U))/2);

% Frequências normalizadas 
omega = linspace(0, pi, length(U));

% Convertendo para frequências em MHz
f_MHz_U = omega/pi * (Fs/2)/1e6;
end