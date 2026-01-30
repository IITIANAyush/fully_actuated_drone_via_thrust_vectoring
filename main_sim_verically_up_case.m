addpath(genpath(pwd));


P = params();     % Load vehicle parameters
T = 5;            % Simulation time

%% Initial Hover State
Omega_h = sqrt(P.m*P.g / (4*P.CT*P.rho*pi*P.R^4));

x0 = zeros(32,1);
x0(13:16) = Omega_h;

%% Input (vertical climb example)
a_z = 1.0;
Omega_up = sqrt(P.m*(P.g + a_z) / (4*P.CT*P.rho*pi*P.R^4));
u_motor = Omega_up / P.motor_K * ones(4,1);

u = [u_motor;
     zeros(4,1);
     zeros(4,1)];

%% Run Simulation
[t, X] = ode45(@(t,x) full_dynamics(t,x,u,P), [0 T], x0);
X = X';

plot_states(t,X);