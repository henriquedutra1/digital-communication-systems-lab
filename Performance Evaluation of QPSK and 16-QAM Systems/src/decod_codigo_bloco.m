%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Henrique Silveira Dutra                    %                                                             
%                 Digital Communication Systems Lab              %                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [mensagens, sindromes, codewords_correto] = decod_codigo_bloco(H, sindrome_erro_tabela, vetor_recebido)
    % Número de bits por palavra-código
    n = size(H, 2);
    k = n - size(H, 1);

    % Verificar se o comprimento do vetor de entrada é um múltiplo de n
    if mod(length(vetor_recebido), n) ~= 0
        error('O número de bits do vetor de entrada não corresponde a um número inteiro de palavras-código.');
    end

    % Número de palavras-código no vetor de entrada
    num_codewords = length(vetor_recebido) / n;

    % Inicializar os vetores de saída
    mensagens = zeros(1, num_codewords * k); % vetor linear para mensagens
    sindromes = zeros(1, num_codewords * size(H, 1)); % vetor linear para sindromes
    codewords_correto = zeros(1, length(vetor_recebido)); % vetor linear para codewords_correto

    % Processar cada palavra-código
    for i = 1:num_codewords
        % Extrair a palavra-código atual
        codeword = vetor_recebido((i-1)*n + 1:i*n);

        % Calcular a síndrome
        syndrome = mod(codeword * H', 2); % Multiplicação e mod 2

        % Procurar o padrão de erro correspondente ao síndrome
        error_pattern = zeros(1, n); % Inicializar o padrão de erro com zeros
        for j = 1:size(sindrome_erro_tabela, 1)
            if isequal(syndrome, sindrome_erro_tabela(j, 1:size(H, 1)))
                error_pattern = sindrome_erro_tabela(j, size(H, 1)+1:end);
                break;
            end
        end

        % Corrigir a palavra-código (soma entre a palavra-código de entrada e o padrão de erro em GF(2))
        corrected_codeword = bitxor(codeword, error_pattern); % Usar XOR para soma em GF(2)

        % Extrair a mensagem da palavra-código corrigida
        message = corrected_codeword(1:k);

        % Armazenar os resultados como vetores lineares
        mensagens((i-1)*k + 1:i*k) = message;
        sindromes((i-1)*size(H, 1) + 1:i*size(H, 1)) = syndrome;
        codewords_correto((i-1)*n + 1:i*n) = corrected_codeword;
    end
end
