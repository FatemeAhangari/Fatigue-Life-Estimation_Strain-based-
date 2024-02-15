function [Life] = MorrowLife(N,Epsilon_a,Sigma_m,E,b,c,SigmaF_Prime,EpsilonF_Prime)
Life = (SigmaF_Prime/E)*(1-(Sigma_m/SigmaF_Prime))*((2*N)^b) + EpsilonF_Prime*(1-(Sigma_m/SigmaF_Prime))^(c/b)*(2*N)^c - Epsilon_a;
end