f1 = 1000; %Hz

fs = 44100;

down_range = [1004, 1017];
up_range = [1001, 1010];

loops = 10;

test = generate_sine(fs, f1);

pause_time = length(test)/fs;



test = generate_sine(fs, f1);

lowest_diff = zeros(1, loops);

for i = 1:loops
    if 1 == mod(i,2)
        "down"
        random_f = randi(down_range);
        modifier = -1;
        target = 0;
    else
        "up"
        random_f = randi(up_range);
        modifier = 1;
        target = 1;
    end

    p = 2;
    while(p ~= target)
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

        random_f = random_f + modifier;

    end

    if 1 == mod(i,2)
        random_f = random_f+1;
    end

    lowest_diff(i) = random_f - f1;

end

%%

mean(lowest_diff)

%%
function x = generate_sine(fs, f)    
    t = 0:1/fs:1-1/fs;
    x = sin(2*pi*f*t);
    
    x(1:fs/100) = x(1:fs/100) .* logspace(0, 1, fs/100);
    x(end - fs/100+1:end) = x(end - fs/100+1:end) .* logspace(1, 0, fs/100);
    
    x = [x, zeros(1, fs/10)];
end