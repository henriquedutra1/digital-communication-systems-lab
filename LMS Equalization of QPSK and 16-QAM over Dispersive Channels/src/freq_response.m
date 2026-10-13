function [H, f] = freq_response(b, a, N, fa)
    % Cria um vetor de frequências de 0 a 2pi
    w = linspace(0, pi, N); 
    
    % Inicializa H com zeros
    H = zeros(1, N);
    
    % Avalia H(e^jw) para cada omega
    for k = 1:N
        % Calcula e^(-jwn) para cada coeficiente
        z = exp(-1j * w(k) * (0:length(b)-1)); % Vetor para B(z)
        num = sum(b .* z); % Numerador B(e^jw)
        
        z = exp(-1j * w(k) * (0:length(a)-1)); % Vetor para A(z)
        den = sum(a .* z); % Denominador A(e^jw)
        
        H(k) = num / den; % Função de transferência
    end
    
    % Converte frequências normalizadas para Hz
    f = (w * fa / (2*pi))/1e6;
end
