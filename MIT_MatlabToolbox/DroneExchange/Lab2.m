%% Problem 4
warning off;

clc;
load data/4.mat;
FlightAnalyzer;
close all;

a_x_bias = mean(RSrun_sensordata(:,2))         % a_x
a_y_bias = mean(RSrun_sensordata(:,3))         % a_y
a_z_bias = mean(RSrun_sensordata(:,4)) - (-9.81)         % a_z
w_x_bias = mean(RSrun_sensordata(:,5))         % w_x
w_y_bias = mean(RSrun_sensordata(:,6))         % w_y
w_z_bias = mean(RSrun_sensordata(:,7))         % w_z
h_sonar = mean(RSrun_sensordata(:,8))          % sonar
h_pressure = mean(altPrs)                      % pressure

std(RSrun_sensordata(:,2))^2
std(RSrun_sensordata(:,3))^2
std(RSrun_sensordata(:,4))^2
std(RSrun_sensordata(:,5))^2
std(RSrun_sensordata(:,6))^2
std(RSrun_sensordata(:,7))^2
std(RSrun_sensordata(:,8))^2        % sonar
std(altPrs)^2                       % pressure

%% Problem 5b
load data/5b_badtexture_130cm.mat;
FlightAnalyzer;
v_x_bias = mean(1/quadEDT.velocityToOpticalFlow_gain*RSrun_opticalFlow(:,2))         % v_x
v_y_bias = mean(1/quadEDT.velocityToOpticalFlow_gain*RSrun_opticalFlow(:,3))         % v_y

v_x_var = std(1/quadEDT.velocityToOpticalFlow_gain*RSrun_opticalFlow(:,2))^2         % v_x
v_y_var = std(1/quadEDT.velocityToOpticalFlow_gain*RSrun_opticalFlow(:,3))^2         % v_y


%% Problem 6

load data/6_turntable_test.mat;
FlightAnalyzer;
close all;

t_start = 6.415;
idx_start = find(RSrun_sensordata(:,1)>t_start, 1);

t   = RSrun_sensordata(:,1);
a_x = RSrun_sensordata(:,2);
a_y = RSrun_sensordata(:,3);
a_z = RSrun_sensordata(:,4);

smooth_param = 100;

a_x_smooth = smooth(a_x,smooth_param);
a_y_smooth = smooth(a_y,smooth_param);
a_z_smooth = smooth(a_z,smooth_param);

a_x_avg = mean(a_x_smooth(idx_start:end))        % a_x
a_y_avg = mean(a_y_smooth(idx_start:end))        % a_y
a_z_avg = mean(a_z_smooth(idx_start:end))        % a_z

%%

r = 0.089;
w_z = RSrun_sensordata(:,7);
w_z_avg = mean(RSrun_sensordata((idx_start:end),7))         % w_z
a_x_comp_avg = w_z_avg^2*r

a_x_comp = w_z.^2*r;

lw = 2; fs_axis = 15; fs_legend = 15;
figure(1); grid on; hold on;
plot(t,a_x_smooth,'LineWidth',lw);
plot(t,a_x_comp,'LineWidth',lw);
xlabel('time [s]');
ylabel('acceleration along body x direction [m/s^2]');
l = legend('filtered measured values','calculated values');
set(l,'FontSize',fs_legend);
set(gca,'FontSize',fs_axis);

