f1 = 500;
fs = 44100;
test = generate_sine(fs, f1);
pause_time = length(test)/fs;

save("input_data")