%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Henrique Silveira Dutra                    %                                                             
%                 Digital Communication Systems Lab              %                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function palavra_codigo = codificador(G, mensagem)
    % Verificar se o comprimento do vetor de entrada � um m�ltiplo do n�mero de linhas da matriz geradora
    [k, n] = size(G);
    L = length(mensagem);
    
    if mod(L, k) ~= 0
        error('O tamanho do vetor de entrada deve ser m�ltiplo do n�mero de linhas da matriz geradora.');
    end
    
    % Determinar o n�mero de mensagens
    num_blocos = L / k;

    y = [];

    for i = 1:num_blocos
        bloco = mensagem((i-1)*k+1 : i*k);
        palavra_codigo = mod(bloco * G, 2);
        y = [y palavra_codigo];
    end

     palavra_codigo = y; 
end

    