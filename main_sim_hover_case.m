clc; clear; close all;
addpath(genpath(pwd));   % Make sure all subfolders are visible

%% Load Parameters
P = params();
T = 5;   % simulation time (s)

%% Compute Hover Rotor Speed
Omega_h = sqrt(P.m*P.g / (4*P.CT*P.rho*pi*P.R^4));

%% Initial State (Perfect Hover)
x0 = zeros(32,1);

% Rigid body states already zero (level & stationary)

% Actuator states
x0(13:16) = Omega_h * ones(4,1);   % motor speeds
x0(17:20) = zeros(4,1);            % eta
x0(21:24) = zeros(4,1);            % gamma
x0(25:28) = zeros(4,1);            % deta
x0(29:32) = zeros(4,1);            % dgamma

%% Hover Input
u_motor = Omega_h / P.motor_K * ones(4,1);

u = [u_motor;
     zeros(4,1);
     zeros(4,1)];

%% Run Simulation
[t, X] = ode45(@(t,x) full_dynamics(t,x,u,P), [0 T], x0);
X = X.';   % transpose for plotting

%% Plot Results
plot_states(t, X);
