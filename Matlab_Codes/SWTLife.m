function [Life] = SWTLife(N,Epsilon_a,Sigma_max,E,b,c,SigmaF_Prime,EpsilonF_Prime)
Epslon_SigmaMax = Sigma_max * Epsilon_a;
Life = (SigmaF_Prime^2/E)*(2*N)^(2*b)+ SigmaF_Prime * EpsilonF_Prime * (2*N)^(b+c)- Epslon_SigmaMax;
end