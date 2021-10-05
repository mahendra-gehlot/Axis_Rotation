clc
clear
% Euler Angles
shi = deg2rad(130);
theta = deg2rad(70);
phi = deg2rad(25);
DCM = angle2dcm(shi,theta,phi,'ZYX');
n1 = inv(DCM)*[1;0;0];
n2 = inv(DCM)*[0;1;0];
n3 = inv(DCM)*[0;0;1];
%% Plotting 
plot3([1 0 0],[0 0 0],[0 0 0],[0 0 0],[0 1 0],[0 0 0],[0 0 0],[0 0 0],[0 0 1],'LineWidth',2)
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
grid on 
hold on
% Body Frame
X = n1;
x1 = linspace(0,X(1));
x2 = linspace(0,X(2));
x3 = linspace(0,X(3));
Y = n2;
y1 = linspace(0,Y(1));
y2 = linspace(0,Y(2));
y3 = linspace(0,Y(3));
Z = n3;
z1 = linspace(0,Z(1));
z2 = linspace(0,Z(2));
z3 = linspace(0,Z(3));
plot3(x1,x2,x3,y1,y2,y3,z1,z2,z3,'LineWidth',2)
%% Euler Axis Plotting
ephi = acos(0.5*(trace(DCM)-1));
ephi_deg = rad2deg(ephi);
e1 = [DCM(2,3)-DCM(3,2),DCM(3,1)-DCM(1,3),DCM(1,2)-DCM(2,1)];
e = (1/(2*sin(ephi))).*e1;
E = e;
E1 = linspace(0,E(1));
E2 = linspace(0,E(2));
E3 = linspace(0,E(3));
plot3(E1,E2,E3,'LineWidth',3,'color','k')
legend('n1','n2','n3','b1','b2','b3','e-axis')