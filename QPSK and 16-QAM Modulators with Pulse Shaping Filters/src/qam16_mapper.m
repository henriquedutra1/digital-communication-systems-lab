function [I_16, Q_16] = qam16_mapper(bitstream)
    % Verifica se o número de bits é múltiplo de 4 (16-QAM utiliza 4 bits por símbolo)
    if mod(length(bitstream), 4) ~= 0
        error('O comprimento do bitstream deve ser um múltiplo de 4 para 16-QAM.');
    end
    
    % Inicialização dos vetores de saída para partes I e Q
    I_16 = zeros(1, length(bitstream)/4);
    Q_16 = zeros(1, length(bitstream)/4);
    
    % Mapeamento dos símbolos de acordo com o bitstream
    for i = 1:length(bitstream)/4
        % Extrai os 4 bits correspondentes ao próximo símbolo
        bits = bitstream((i-1)*4 + (1:4));
        
        % Mapeamento dos bits para partes I e Q do símbolo
        if bits(1) == 0 && bits(2) == 0
            I_16(i) = -3;
        elseif bits(1) == 0 && bits(2) == 1
            I_16(i) = -1;
        elseif bits(1) == 1 && bits(2) == 1
            I_16(i) = 1;
        elseif bits(1) == 1 && bits(2) == 0
            I_16(i) = 3;
        end
        
        if bits(3) == 0 && bits(4) == 0
            Q_16(i) = 3;
        elseif bits(3) == 0 && bits(4) == 1
            Q_16(i) = 1;
        elseif bits(3) == 1 && bits(4) == 1
            Q_16(i) = -1;
        elseif bits(3) == 1 && bits(4) == 0
            Q_16(i) = -3;
        end
    end
end
