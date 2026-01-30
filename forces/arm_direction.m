function r = arm_direction(i)
switch i
    case 1, r = [1;0;0];
    case 2, r = [-1;0;0];
    case 3, r = [0;1;0];
    case 4, r = [0;-1;0];
end
end