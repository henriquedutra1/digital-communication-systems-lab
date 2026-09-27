%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Henrique Silveira Dutra                    %                                                             
%                 Digital Communication Systems Lab              %                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [I, Q] = mapper_QPSK(bitstream)
% Definindo os símbolos QPSK
    symbols = [1+1i, -1+1i, 1-1i, -1-1i];
    
    % Mapeamento dos bits para os símbolos QPSK
    I = zeros(1, length(bitstream)/2);
    Q = zeros(1, length(bitstream)/2);
    
    for i = 1:2:length(bitstream)
        % Obtendo o par de bits
        par_bits = bitstream(i:i+1);
        
        % Convertendo o par de bits para um índice decimal
        index = bin2dec(num2str(par_bits)) + 1;
        
        % Atribuindo o símbolo correspondente
        I((i+1)/2) = real(symbols(index));
        Q((i+1)/2) = imag(symbols(index));
    end
end
