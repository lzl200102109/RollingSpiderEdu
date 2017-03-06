close all;

fs_l = 20; fs_axis = 20; lw = 2;

%%
figure(3); 
plot(RSrun_pos_ref(:,1), RSrun_pos_ref(:,2:3));

set(gca, 'FontSize', fs_axis);
l = legend('x_{ref}', 'y_{ref}');
set(l, 'FontSize', fs_l);
xlabel('Time [s]', 'FontSize', fs_axis);
ylabel('Position [m]', 'FontSize', fs_axis);

%%

figure(1); clf; grid on; hold on;
plot(posComparision(:,1), posComparision(:,2:4), '--', 'LineWidth', lw);
plot(posComparision(:,1), posComparision(:,5:end), 'LineWidth', lw);
set(gca, 'FontSize', fs_axis);
l = legend('x_{quad}', 'y_{quad}', 'z_{quad}');
l = legend('x_{ref}', 'y_{ref}', 'z_{ref}', 'x_{quad}', 'y_{quad}', 'z_{quad}');
set(l, 'FontSize', fs_l);
xlabel('Time [s]', 'FontSize', fs_axis);
ylabel('Position [m]', 'FontSize', fs_axis);

figure(4); clf; grid on; hold on;
plot(posComparision(:,2), posComparision(:,3), '--', 'LineWidth', lw);
plot(posComparision(:,5), posComparision(:,6), 'LineWidth', lw);
set(gca, 'FontSize', fs_axis);
l = legend('ref', 'actual');
set(l, 'FontSize', fs_l);
xlabel('X [m]', 'FontSize', fs_axis);
ylabel('Y [m]', 'FontSize', fs_axis);
xlim([-0.5 ,1.5]);
ylim([-0.5 ,1.5]);
axis equal;

%%
figure(2); clf; grid on; hold on;
plot(attComparision(:,1), attComparision(:,5:end), 'LineWidth', lw);
set(gca, 'FontSize', fs_axis);
l = legend('yaw_{quad}', 'pitch_{quad}', 'row_{quad}');
set(l, 'FontSize', fs_l);
xlabel('Time [s]', 'FontSize', fs_axis);
ylabel('Euler Angles [rad]', 'FontSize', fs_axis);

%%
figure(3); clf; grid on; hold on;
plot(motorCmds(:,1), motorCmds(:,2:end), 'LineWidth', lw);
set(gca, 'FontSize', fs_axis);
l = legend('Motor 1 cmd', 'Motor 2 cmd', 'Motor 3 cmd', 'Motor 4 cmd');
set(l, 'FontSize', fs_l);
xlabel('Time [s]', 'FontSize', fs_axis);
ylabel('Motor Cmds [-]', 'FontSize', fs_axis);

%%
