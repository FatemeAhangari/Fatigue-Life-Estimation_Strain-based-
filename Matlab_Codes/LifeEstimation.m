clc;
clear all;
%% Material Property
E = 210000;
b = -0.064;
c = -0.722;
SigmaF_Prime = 1170;
EpsilonF_Prime = 1.351;

%% Cycle characteristics
Epsilon_a =0.0019594;
Sigma_m =393.6557;
Sigma_max =800.4275;
%%
options = optimset('TolFun',1e-16);
Morrow = fsolve(@(N)MorrowLife(N,Epsilon_a,Sigma_m,E,b,c,SigmaF_Prime,EpsilonF_Prime),100,options)
ModifiedMorrow = fsolve(@(N)ModifiedMorrow(N,Epsilon_a,Sigma_m,E,b,c,SigmaF_Prime,EpsilonF_Prime),100,options)
SWTLife = fsolve(@(N)SWTLife(N,Epsilon_a,Sigma_max,E,b,c,SigmaF_Prime,EpsilonF_Prime),100,options)