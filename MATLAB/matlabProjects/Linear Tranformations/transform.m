function [v_out] = transform(m_transformer, v_in)
    
    v_out = m_transformer * v_in;

%     plot(v_in, 'r', v_out, 'b')
%     legend('input vector', 'transformed vector')
    quiver([0, 0], v_in)

end