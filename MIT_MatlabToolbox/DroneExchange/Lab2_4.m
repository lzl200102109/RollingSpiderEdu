clc;

mean(RSrun_sensordata(:,2))
mean(RSrun_sensordata(:,3))
mean(RSrun_sensordata(:,4))
mean(RSrun_sensordata(:,5))
mean(RSrun_sensordata(:,6))
mean(RSrun_sensordata(:,7))
mean(RSrun_sensordata(:,8))        % sonar
mean(altPrs)                       % pressure

disp('\n');

std(RSrun_sensordata(:,2))^2
std(RSrun_sensordata(:,3))^2
std(RSrun_sensordata(:,4))^2
std(RSrun_sensordata(:,5))^2
std(RSrun_sensordata(:,6))^2
std(RSrun_sensordata(:,7))^2
std(RSrun_sensordata(:,8))^2        % sonar
std(altPrs)^2                       % pressure