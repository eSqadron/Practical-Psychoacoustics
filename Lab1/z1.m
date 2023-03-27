f1 = 1000;
f2 = [1003, 1006, 1009, 1012, 1015, 1018];

correctness = zeros(1, 6);
un_correctness = zeros(1, 6);

fs = 44100;

test = generate_sine(fs, f1);


pause_time = 2;

tab_t = zeros(1,6);
tab_av = 1:6;

for i = 1:2
    rand_v = selectRandom(tab_av)
    random_f = f2(rand_v);
    tab_t(rand_v) = tab_t(rand_v)+1;

    if 1 == tab_t(rand_v)
        tab_av = tab_av(tab_av~=rand_v)
    end

    r_h = 0;

    if randi(2) == 2
        1000
        sound(generate_sine(fs, f1), fs);
        pause(pause_time)

        random_f
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        r_h = 2;
    else
        random_f
        sound(generate_sine(fs, random_f), fs);
        pause(pause_time)

        1000
        sound(generate_sine(fs, f1), fs);
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

save("correcness_data.mat", "f1", "f2", "correctness", "un_correctness");

%%
load("correcness_data.mat")

X = f2 - ones(1, length(f2)) .* f1;
Y = correctness.*100./10;

b1 = X'\Y';

x_80 = interp1(b1*X, X, 80);

figure
hold on
scatter(X, Y, 'DisplayName', 'procent poprawnych odp');
plot(X, b1*X, 'DisplayName', 'regresja liniowa');

if ~isnan(x_80)
    plot(x_80, b1*x_80, 'O', 'DisplayName', 'punkt 80%');
end

xlabel("Różnica częstotliwości [Hz]");
ylabel("procent poprawnie zgadniętych [%]");
legend();
ylim([0 100])

%%

function x = generate_sine(fs, f)    
    t = 0:1/fs:1-1/fs;
    x = sin(2*pi*f*t);
    
    x(1:fs/100) = x(1:fs/100) .* logspace(0, 1, fs/100);
    x(end - fs/100+1:end) = x(end - fs/100+1:end) .* logspace(1, 0, fs/100);
    
    x = [x, zeros(1, fs)];
end


function selectedValues = selectRandom(dataSet)
  selectedValues = dataSet(randi(numel(dataSet), 1, 1));
end

