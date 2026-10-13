function bitstream = qam16_demapper(I, Q)

    % Inicializar vetor de bits
bitstream = [];
    for i = 1:length(I)
        if I(i) < -2
            if Q(i) >= 2
                bitstream = [bitstream, [0 0 0 0]];
            elseif Q(i) >= 0 && Q(i) < 2
                bitstream = [bitstream, [0 0 0 1]];
            elseif Q(i) >= -2 && Q(i) < 0
                bitstream = [bitstream, [0 0 1 1]];
            else
                bitstream = [bitstream, [0 0 1 0]];
            end
            
        elseif I(i) <= 0 && I(i) > -2
            if Q(i) >= 2
                bitstream = [bitstream, [0 1 0 0]];
            elseif Q(i) >= 0 && Q(i) < 2
                bitstream = [bitstream, [0 1 0 1]];
            elseif Q(i) >= -2 && Q(i) < 0
                bitstream = [bitstream, [0 1 1 1]];
            else
                bitstream = [bitstream, [0 1 1 0]];
            end
            
        elseif I(i) >= 0 && I(i) < 2
            if Q(i) >= 2
                bitstream = [bitstream, [1 1 0 0]];
            elseif Q(i) >= 0 && Q(i) < 2
                bitstream = [bitstream, [1 1 0 1]];
            elseif Q(i) >= -2 && Q(i) < 2
                bitstream = [bitstream, [1 1 1 1]];
            else
                bitstream = [bitstream, [1 1 1 0]];
            end
            
        elseif I(i) >= 2
            if Q(i) >= 2
                bitstream = [bitstream, [1 0 0 0]];
            elseif Q(i) >= 0 && Q(i) < 2
                bitstream = [bitstream, [1 0 0 1]];
            elseif Q(i) >= -2 && Q(i) < 0
                bitstream = [bitstream, [1 0 1 1]];
            else
                bitstream = [bitstream, [1 0 1 0]];
            end
        end
    end
end
    
    
