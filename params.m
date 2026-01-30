function P = params()

P.m  = 3.0;
P.g  = 9.81;
P.I  = diag([0.05 0.05 0.09]);

P.L = 0.3;

P.CT = 0.013;
P.CQ = 0.0013;
P.rho = 1.225;
P.R = 0.1524;

P.motor_tau = 0.16;
P.motor_K   = 9.19;

P.servo_wn = 35;
P.servo_z  = 0.7;

P.spin_dir = [1 -1 1 -1];

end
