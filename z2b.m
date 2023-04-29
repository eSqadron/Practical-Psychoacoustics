load("input_data")

lowest_hearable_diff = intmax;

hear_diffs_it = [];
hear_diffs = [];

non_hear_diffs_it = [];
non_hear_diffs = [];

it_hear = 0;
it_non_hear = 0;

random_f = input("Podaj pierwszą częstotliwość do porównania z " + num2str(f1) + "Hz: ");

while(-1 ~= random_f)
    if randi(2) == 2
        f1;
        sound(test, fs);
        pause(pause_time)

        random_f;
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)
    else
        random_f;
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        f1;
        sound(test, fs);
        pause(pause_time)
    end
    p = input("Czy słyszysz różnicę? jak tak podaj 1, jak nie 0: ");

    if 1 == p
        it_hear = it_hear + 1;
        hear_diffs_it(it_hear) = it_hear + it_non_hear;
        hear_diffs(it_hear) = abs(random_f-f1);
    end
    if 0 == p
        it_non_hear = it_non_hear + 1;
        non_hear_diffs_it(it_non_hear) = it_hear + it_non_hear;
        non_hear_diffs(it_non_hear) = abs(random_f-f1);
    end
    
    if 1 == p && abs(f1 - random_f) < lowest_hearable_diff
        lowest_hearable_diff = abs(f1 - random_f);
    end

    random_f = input("Podaj nową częstotliwość, lub -1 jeżeli chcesz wyjśc: ");
end

save("l2/correcness_data_b.mat", "lowest_hearable_diff", "f1", "hear_diffs_it", "hear_diffs", "non_hear_diffs_it", "non_hear_diffs", "it_hear", "it_non_hear");
%%
load("l2/correcness_data_b.mat");

all_iter = it_hear + it_non_hear;

mean_c = mean(lowest_hearable_diff);

figure
hold on
scatter(hear_diffs_it, hear_diffs, "DisplayName", "hearable diffs.");
scatter(non_hear_diffs_it, non_hear_diffs, "DisplayName", "non - hearable diffs.");
plot(1:all_iter, ones(1, all_iter) * lowest_hearable_diff, "DisplayName", "lowest hearable diff = " + num2str(lowest_hearable_diff))
title("Method of adjustment for f_1 = " + num2str(f1) + "Hz")
xlabel("iteration")
ylabel("frequency difference [Hz]")
legend()