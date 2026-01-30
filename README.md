# 🚁 Thrust-Vectoring Fully-Actuated Drone Simulation (MATLAB)

This project implements a **nonlinear 6-DOF dynamic simulation** of a **fully-actuated quadrotor with thrust vectoring**, built in MATLAB.  
The model includes rigid-body dynamics, rotor thrust vectoring, and realistic actuator dynamics for motors and servos.

The simulation framework is modular and designed for research, controls development, and advanced UAV modeling.

---

## ✨ Features

- Full **6-DOF rigid body dynamics**
- **Thrust-vectoring propulsion model**
- **Motor dynamics** (1st-order lag)
- **Servo tilt dynamics** (2nd-order system)
- Modular and extendable MATLAB structure
- ODE45-based continuous time simulation
- Hover trim and vertical motion test scenarios

---

## 🧠 System Overview

Each rotor produces thrust along a **tiltable axis**, enabling the drone to generate forces in all 3 spatial directions **without tilting the body** — making it a **fully actuated aerial vehicle**.

The model includes:

| Subsystem | Description |
|----------|-------------|
| Rigid Body | Newton-Euler 6-DOF dynamics |
| Propulsion | Thrust & drag torque from propeller coefficients |
| Thrust Vectoring | Rotor tilt using two servo angles per rotor |
| Motors | First-order speed response |
| Servos | Second-order tilt angle dynamics |

---

## 📂 Project Structure

main_hover.m → Hover equilibrium simulation
main_sim.m → Motion test scenarios

params.m → Vehicle & actuator parameters

dynamics/
full_dynamics.m
rigid_body.m
actuator_dynamics.m

forces/
forces_moments.m
arm_direction.m

utils/
R_body_to_inertial.m
plot_states.m




---

## ▶️ How to Run

1. Open MATLAB  
2. Set the project folder as the **Current Folder**
3. Run one of the main scripts:

### Hover Test
```matlab
main_hover


The simulator generates plots for:

Attitude (roll, pitch, yaw)

Angular rates

Body velocities

Position (X, Y, Z)

Rotor speeds

Servo tilt angles

3D trajectory
