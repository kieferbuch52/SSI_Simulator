clear ;
close all ;
clc ;

%% �x�[�X�l %%
%{
SB = 1000;
VB = 100;
IB = (SB / VB);
ZB = (VB^2 / SB);
%}
%% ���͒l %%
Pm = 300;
E0 = 100;
Vl = 100;
Zg = 0.1;

Yg = inv(Zg);

%% ���h������ %%
wref = 2 * pi * 60;
M = 1;
D = 60;

R1 = 0.483;
X1 = (10 * 10^-3 * 2 * pi * 60);
R2 = 0.0417;
X2 = (6.4 * 10^-6 * 2 * pi * 60);

%% �A�h�~�^���X�v�Z %%
Z1 = complex(R1, X1);
G1 = R1 / (R1^2 + X1^2);
B1 = -X1 / (R1^2 + X1^2);
Y1 = complex(G1, B1);
phi1 = atan(X1 / R1); 

Z2 = complex(R2, X2);
G2 = R2 / (R2^2 + X2^2);
B2 = -X2 / (R2^2 + X2^2);
Y2 = complex(G2, B2);
phi2 = atan(X2 / R2);

YGG = inv(Y1 + Y2 + Yg);

%% �K�o�i %%
Kgov = 1;
Tgov = 0.1;

%% AVR(�ߓn����xG) %%
Kavr = 1;
Tavr = 0.01;

%% AVR(7F) %%
Vref = 100;
Qref = 0;
Qsig = 1; %0=V,1=Q
sw = 1;   %0=1L,1=PI
KQ = 0.05;
Kvq = 0.1;
Tvq = 0.01;
Kp = 20;
Ki = 20;

%% Simulink�N�� %%
sim('SSI_Simulator');