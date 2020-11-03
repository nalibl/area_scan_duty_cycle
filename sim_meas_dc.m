function [] = sim_meas_dc(period, on_time, N,dx)
%MEAS_DC Summary of this function goes here
%   Detailed explanation goes here
L = dx * N;
dk = 1/L;
x_grid = (-floor(N/2):floor(N/2))*dx;
k_grid = (-floor(N/2):floor(N/2))*dk;
n_periods = ceil(N/period);
dc = on_time/period;
k_wave = 2*pi/period;
y_single = [ones(1,on_time), zeros(1,period-on_time)];
y_long = repmat(y_single,[1, n_periods]);
y = y_long(1:N);
% figure;
% plot(x_grid,y)
Y = fftshift(fft(y));
figure;
plot(k_grid, abs(Y));
end

