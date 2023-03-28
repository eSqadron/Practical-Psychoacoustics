f1 = 1000; %Hz

fs = 44100;

down_range = [1004, 1017];
up_range = [1001, 1010];

loops = 10;

test = generate_sine(fs, f1);

pause_time = length(test)/fs;



test = generate_sine(fs, f1);

lowest_diff = intmax;

random_f = input("Podaj częstotliwość startową");

while(-1 ~= random_f)
    if randi(2) == 2
        1000
        sound(generate_sine(fs, f1), fs);
        pause(pause_time)

        random_f
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)
    else
        random_f
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        1000
        sound(generate_sine(fs, f1), fs);
        pause(pause_time)
    end
    p = input("Czy słyszysz różnicę? jak tak podaj 1, jak nie 0: ");
    
    if 1 == p && abs(f1 - random_f) < lowest_diff
        lowest_diff = abs(f1 - random_f);
    end

    random_f = input("Podaj nową częstotliwość, lub -1 jeżeli chcesz wyjśc");


end
%%
'otrzymany wynik: '
lowest_diff

%%
function x = generate_sine(fs, f)    
    t = 0:1/fs:1-1/fs;
    x = sin(2*pi*f*t);
    
    x(1:fs/100) = x(1:fs/100) .* logspace(0, 1, fs/100);
    x(end - fs/100+1:end) = x(end - fs/100+1:end) .* logspace(1, 0, fs/100);
    
    x = [x, zeros(1, fs/10)];
end