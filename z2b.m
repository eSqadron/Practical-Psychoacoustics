load("input_data")

down_range = [504, 517];
up_range = [501, 510];

lowest_diff = intmax;

random_f = input("Podaj częstotliwość startową");

while(-1 ~= random_f)
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
    
    if 1 == p && abs(f1 - random_f) < lowest_diff
        lowest_diff = abs(f1 - random_f);
    end

    random_f = input("Podaj nową częstotliwość, lub -1 jeżeli chcesz wyjśc");


end
%%
mean(lowest_diff)

figure
hold on
scatter(1:length(lowest_diff), lowest_diff);
title("minimalna różnica w kolejnych iteracjach")
xlabel("iteracja")
ylabel("różnica częstotliwości")