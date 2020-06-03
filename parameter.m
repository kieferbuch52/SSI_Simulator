clear ;
close all ;
clc ;

%% ベース値 %%
%{
SB = 1000;
VB = 100;
IB = (SB / VB);
ZB = (VB^2 / SB);
%}
%% 入力値 %%
Pm = 300;
E0 = 100;
Vl = 100;

Yg = 0;

%% 動揺方程式 %%
wref = 2 * pi * 60;
M = 1;
D = 1.5;

R1 = 0.483 / ZB;
X1 = (10 * 10^-3 * 2 * pi * 60) / ZB;
R2 = 0.0417 / ZB;
X2 = (6.4 * 10^-6 * 2 * pi * 60) / ZB;

%% アドミタンス計算 %%
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

%% ガバナ %%
Kgov = 1;
Tgov = 0.1;

%% AVR(過渡安定度G) %%
Vref = 1;
Kavr = 1;
Tavr = 0.01;

%% AVR(7F) %%
Qref = 0;
Qsig = 1; %0=V,1=Q
sw = 1;   %0=1L,1=PI
KQ = 0.05;
Kvq = 0.1;
Tvq = 0.01;
Kp = 20;
Ki = 20;

%% Simulink起動 %%
sim('SSI_Simulator');