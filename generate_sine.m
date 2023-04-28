function x = generate_sine(fs, f)    
    t = 0:1/fs:1-1/fs;
    x = sin(2*pi*f*t);
    
    x(1:fs/100) = x(1:fs/100) .* logspace(0, 1, fs/100);
    x(end - fs/100+1:end) = x(end - fs/100+1:end) .* logspace(1, 0, fs/100);
    
    x = [x, zeros(1, fs/10)];
end

