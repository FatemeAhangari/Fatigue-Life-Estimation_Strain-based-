function F = UnloadFunction(dsigma,dS,E,K_Prime,n_Prime,kt)
    A = ((kt^2*dS^2)/E);
    %% Function %%
    F = ((dsigma^2)/E)+ 2*dsigma*((dsigma/(2*K_Prime))^(1/n_Prime))- A;
end

