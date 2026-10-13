function bitstream = qpsk_demapper(I, Q)

    % Initialize bitstream vector
    bitstream = [];
    
    % Iterate over each symbol
    for i = 1:length(I)
        if I(i) >= 0
            if Q(i) >= 0
                % I(i) >= 0, Q(i) >= 0 (00)
                bitstream = [bitstream, [0 0]];
            else
                % I(i) >= 0, Q(i) < 0 (10)
                bitstream = [bitstream, [1 0]];
            end
        else
            if Q(i) >= 0
                % I(i) < 0, Q(i) >= 0 (01)
                bitstream = [bitstream, [0 1]];
            else
                % I(i) < 0, Q(i) < 0 (11)
                bitstream = [bitstream, [1 1]];
            end
        end
    end

end
