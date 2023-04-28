load("input_data")

f2 = [503, 506, 509, 512, 515, 518];

correctness = zeros(1, length(f2));
un_correctness = zeros(1, length(f2));

tab_t = zeros(1,length(f2));
tab_av = 1:length(f2);

test_loops = 10;

for i = 1:test_loops*length(f2)
    rand_v = selectRandom(tab_av);
    random_f = f2(rand_v);
    tab_t(rand_v) = tab_t(rand_v)+1;

    if test_loops == tab_t(rand_v)
        tab_av = tab_av(tab_av~=rand_v);
    end

    if randi(2) == 2
        f1;
        sound(test, fs);
        pause(pause_time)

        random_f;
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        r_h = 2;
    else
        random_f;
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        f1;
        sound(test, fs);
        pause(pause_time)

        r_h = 1;
    end
    p = input("który wyższy? podaj 1 lub 2: ");
    if p == r_h
        correctness(rand_v) = correctness(rand_v) + 1;
    else
        un_correctness(rand_v) = un_correctness(rand_v) + 1;
    end

end

save("l1/correcness_data.mat", "f1", "f2", "correctness", "un_correctness");

%%
load("l1/correcness_data.mat")

X = f2 - ones(1, length(f2)) .* f1;

Y = correctness.*100./10;

b1 = X'\Y';

x_80 = interp1(b1*X, X, 80);

figure
hold on
scatter(X, Y, 'DisplayName', 'procent poprawnych odp');
plot(X2, b1*X2, 'DisplayName', 'regresja liniowa');
plot(x_80, b1*x_80, 'O', 'DisplayName', strcat('punkt Y=80% X = ', num2str(x_80)));
xlabel("Różnica częstotliwości [Hz]");
ylabel("procent poprawnie zgadniętych [%]");
legend();
ylim([0 100])

%%
function selectedValues = selectRandom(dataSet)
  selectedValues = dataSet(randi(numel(dataSet), 1, 1));
end

