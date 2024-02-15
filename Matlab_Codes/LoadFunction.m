function F = LoadFunction(sigma,ds,E,K_Prime,n_Prime,kt)
    A = ((kt^2*ds^2)/E);
    %% Function %%
    F = ((sigma^2)/E)+(sigma^((1/n_Prime)+1))/K_Prime^(1/n_Prime)- A;
end