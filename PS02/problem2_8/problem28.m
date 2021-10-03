[time_pos, sq_wave, B_unnorm] = generate_data
%part(a)
plot(time_pos, sq_wave)

%part(b)
orthogonal = true
for i = 1:30
    basis_i = B_unnorm(i,:)
    for j = i+1:30
        basis_j = B_unnorm(j,:)
        if dot(basis_i.', basis_j) > 1e-3 || dot(basis_i.', basis_j) < -1e-3
            orthogonal = false
            break
        end
    end
end
orthogonal

%%part(b) ctnd
labels = ["basis 1", "basis 2", "basis 3", "basis 4", "basis 5", "basis 6", "basis 30"];
stackedplot(time_pos, B_unnorm([1,2,3,4,5,6,30], :).', "DisplayLabels",labels)

%%part(c)
coeff = ones(30, 1)
for i = 1:30
    B_unnorm(i, :) = B_unnorm(i, :)/norm(B_unnorm(i, :))
    coeff(i) = abs(dot(sq_wave.', B_unnorm(i, :)))
end

fourier_approx = zeros(30, 200001)
for i = 1:30
    if i == 1
        fourier_approx(i, :) = coeff(i) * B_unnorm(i, :)
    else
        fourier_approx(i, :) = fourier_approx(i-1, :) + coeff(i) * B_unnorm(i, :)
    end
end

subplot(7, 1, 1)
plot(time_pos, fourier_approx(1, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1') 

subplot(7, 1, 2)
plot(time_pos, fourier_approx(2, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-2')

subplot(7, 1, 3)
plot(time_pos, fourier_approx(3, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-3')

subplot(7, 1, 4)
plot(time_pos, fourier_approx(4, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-4')

subplot(7, 1, 5)
plot(time_pos, fourier_approx(5, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-5')

subplot(7, 1, 6)
plot(time_pos, fourier_approx(6, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-6')

subplot(7, 1, 7)
plot(time_pos, fourier_approx(30, :), 'b', time_pos, sq_wave, 'r')
ylabel('basis 1-30')



function [time_pos , sq_wave , B_unnorm] = generate_data
    n_comps = 30;  period = 10;  fundFreq = 1/ period;
    time_pos = 0:0.0001:2* period; harmonics = 2*(1: n_comps) -1;
    sq_wave = floor (0.9* sin (2*pi*fundFreq*time_pos))+.5;%% generate  the  signal
    B_unnorm = sin(2*pi*fundFreq *(harmonics'* time_pos))/2;%% generate  the  basis
end