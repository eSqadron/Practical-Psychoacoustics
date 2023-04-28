load("input_data")

down_range = [504, 5017];
up_range = [501, 510];

loops = 10;

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
            f1
            sound(test, fs);
            pause(pause_time)
    
            random_f
            sound(generate_sine(fs, random_f), fs);
            pause(pause_time)
        else
            random_f
            sound(generate_sine(fs, random_f), fs);
            pause(pause_time)
    
            f1
            sound(test, fs);
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

figure
hold on
scatter(1:length(lowest_diff), lowest_diff);
title("minimalna różnica w kolejnych iteracjach")
xlabel("iteracja")
ylabel("różnica częstotliwości ")