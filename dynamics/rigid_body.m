function xdot = rigid_body(x, F, M, P)
phi = x(1); theta = x(2); psi = x(3);
p = x(4); q = x(5); r = x(6);
u = x(7); v = x(8); w = x(9);

% Euler angle rates
E = [
    1 sin(phi)*tan(theta) cos(phi)*tan(theta)
    0 cos(phi)           -sin(phi)
    0 sin(phi)/cos(theta) cos(phi)/cos(theta)
];
euler_dot = E*[p;q;r];

% Rotational dynamics
omega = [p;q;r];
omega_dot = P.I \ (M - cross(omega, P.I*omega));

% Translational dynamics (body frame)
Vb = [u; v; w];
Vb_dot = (1/P.m)*F - cross(omega, Vb);

% Position dynamics
R = R_body_to_inertial(phi, theta, psi);
pos_dot = R * Vb;

xdot = [euler_dot;
        omega_dot;
        Vb_dot;
        pos_dot];
end