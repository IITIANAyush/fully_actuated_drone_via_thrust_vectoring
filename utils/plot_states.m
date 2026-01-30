function plot_states(t, X)

% -------- Attitude --------
figure('Name','Attitude');
subplot(3,1,1)
plot(t, X(1,:)*180/pi, 'LineWidth', 1.5)
ylabel('\phi (deg)'); grid on

subplot(3,1,2)
plot(t, X(2,:)*180/pi, 'LineWidth', 1.5)
ylabel('\theta (deg)'); grid on

subplot(3,1,3)
plot(t, X(3,:)*180/pi, 'LineWidth', 1.5)
ylabel('\psi (deg)')
xlabel('Time (s)')
grid on

% -------- Body Rates --------
figure('Name','Body Rates');
plot(t, X(4:6,:)', 'LineWidth', 1.5)
legend('p','q','r')
xlabel('Time (s)')
ylabel('rad/s')
grid on

% -------- Body Velocities --------
figure('Name','Body Velocities');
plot(t, X(7,:), 'LineWidth', 1.5); hold on
plot(t, X(8,:), 'LineWidth', 1.5);
plot(t, X(9,:), 'LineWidth', 1.5);
legend('u','v','w')
xlabel('Time (s)')
ylabel('m/s')
grid on

% -------- Position --------
figure('Name','Position');
plot(t, X(10,:), 'LineWidth', 1.5); hold on
plot(t, X(11,:), 'LineWidth', 1.5);
plot(t, X(12,:), 'LineWidth', 1.5);
legend('X','Y','Z')
xlabel('Time (s)')
ylabel('m')
grid on

% -------- Rotor Speeds --------
figure('Name','Rotor Speeds');
plot(t, X(13:16,:)', 'LineWidth', 1.5)
legend('\Omega_1','\Omega_2','\Omega_3','\Omega_4')
xlabel('Time (s)')
ylabel('rad/s')
grid on

% -------- Servo Angles --------
figure('Name','Servo Tilt Angles');

subplot(2,1,1)
plot(t, X(17:20,:)'*180/pi, 'LineWidth', 1.5)
title('\eta Angles')
ylabel('deg')
grid on

subplot(2,1,2)
plot(t, X(21:24,:)'*180/pi, 'LineWidth', 1.5)
title('\gamma Angles')
ylabel('deg')
xlabel('Time (s)')
grid on

% -------- 3D Trajectory --------
figure('Name','3D Trajectory');
plot3(X(10,:), X(11,:), X(12,:), 'LineWidth', 2)
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
grid on
axis equal
title('Drone Trajectory')

end
