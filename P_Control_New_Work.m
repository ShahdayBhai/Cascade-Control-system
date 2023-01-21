clc
clear
close all
A=[-0.4 0.3; 3 -4.5];
B=[-0.4 7.5 0.1 0; 50 0 0 1.5];
C=[0 1; 1 0];
D=0;
% for 1st input the tf of the system is
num1=15;
den1=[1 4.9 0.9];
g1=tf(num1,den1);
% for 2nd input
num2=[50 20];
den2=[1 4.9 0.9];
g2=tf(num2,den2);
plant=g1*g2;
step(plant)
n=[750 300];
d=[1 9.8 25.81 8.82 0.81];
[r p k]=residue(n,d);
% PI control
Kp=3;Ki=0.15;
Control=tf([Kp Ki], [50,0]);
sys_cl=feedback(Control*plant,1);
t=0:0.01:10;
step(sys_cl,t);
s=stepinfo(sys_cl);
sys = zpk([750],[-4.7089 -4.7089 -0.1911 -0.1911],300); 
[C_p,info] = pidtune(sys,'P')