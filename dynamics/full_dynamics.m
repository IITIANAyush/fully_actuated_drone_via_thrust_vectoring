function xdot = full_dynamics(~, x, u, P)

[F, M] = forces_moments(x, P);

phi = x(1); theta = x(2);
Fg = P.m * P.g * [
    -sin(theta);
     sin(phi)*cos(theta);
     cos(phi)*cos(theta)
];

F_total = F - Fg;

xdot_rb  = rigid_body(x(1:12), F_total, M, P);
xdot_act = actuator_dynamics(x(13:32), u, P);

xdot = [xdot_rb;
        xdot_act];
end
