function xdot = actuator_dynamics(x, u, P)

Omega  = x(1:4);
eta    = x(5:8);
gamma  = x(9:12);
deta   = x(13:16);
dgamma = x(17:20);

u_motor = u(1:4);
u_eta   = u(5:8);
u_gamma = u(9:12);

dOmega = (P.motor_K*u_motor - Omega)/P.motor_tau;

ddeta = -2*P.servo_z*P.servo_wn*deta ...
        -P.servo_wn^2*(eta - u_eta);

ddgamma = -2*P.servo_z*P.servo_wn*dgamma ...
          -P.servo_wn^2*(gamma - u_gamma);

xdot = [dOmega;
        deta;
        dgamma;
        ddeta;
        ddgamma];
end
