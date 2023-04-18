f1 = 1000; %Hz

fs = 44100;

compare_freq = randi([1008, 1012]);

loops_to_break = 3;
it = 0;

up_delta = 1;
down_delta = 2;

corrects_before_going_down = 3;
incorrects_before_going_up = 2;

pause_time = length(generate_sine(fs, f1))/fs;


correct_ans = 0;
incorrect_ans = 0;

lowest_diff = zeros(1, loops_to_break);

dir = "start";

while(1)
    if randi(2) == 2
        1000
        sound(generate_sine(fs, f1), fs);
        pause(pause_time)

        compare_freq
        sound(generate_sine(fs, compare_freq), fs);
        pause(pause_time)

        higher_one = 2;
    else
        compare_freq
        sound(generate_sine(fs, compare_freq), fs);
        pause(pause_time)

        1000
        sound(generate_sine(fs, f1), fs);
        pause(pause_time)

        higher_one = 1;
    end
    
    p = input("jeżeli 1 jest wyżej, podaj 1, jeżeli 2 jest wyżej podaj 2");

    if(higher_one == p)
        correct_ans=correct_ans+1;
        incorrect_ans = 0;
    else
        incorrect_ans=incorrect_ans+1;
        correct_ans = 0;
    end

%     correct_ans
%     incorrect_ans

    if((dir == "start" && correct_ans == corrects_before_going_down) || (dir == "start" && incorrect_ans == incorrects_before_going_up))
        if(correct_ans == corrects_before_going_down)
            dir = "down"
            compare_freq = compare_freq  - down_delta;
        end
        if(incorrect_ans == incorrects_before_going_up)
            dir = "up"
            compare_freq = compare_freq + up_delta;
        end

        correct_ans = 0;
        incorrect_ans = 0;
    end

    if(correct_ans == corrects_before_going_down)
        correct_ans = 0;
        incorrect_ans = 0;
        if(dir == "up")
            it = it + 1;
            lowest_diff(it) = compare_freq - f1;
            dir = "down"
        end
        compare_freq = compare_freq  - down_delta;
    end

    if(incorrect_ans == incorrects_before_going_up)
        correct_ans = 0;
        incorrect_ans = 0;
        if(dir == "down")
            it = it + 1;
            lowest_diff(it) = compare_freq - f1;
            dir = "up"
        end
        compare_freq = compare_freq + up_delta;
    end

    if(it == loops_to_break)
        break;
    end
end

%%

mean(lowest_diff)

figure
plot(lowest_diff)

%%
function x = generate_sine(fs, f)    
    t = 0:1/fs:1-1/fs;
    x = sin(2*pi*f*t);
    
    x(1:fs/100) = x(1:fs/100) .* logspace(0, 1, fs/100);
    x(end - fs/100+1:end) = x(end - fs/100+1:end) .* logspace(1, 0, fs/100);
    
    x = [x, zeros(1, fs/10)];
end