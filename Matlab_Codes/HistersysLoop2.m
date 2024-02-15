clc;
clear all;
%% Data for Al 2024 T351
E = 210000;
K_Prime = 1353; 
n_Prime = 0.077;
kt = 2.46;

% % % Problem 1
% Point = [0;367.47;36.747;367.47;36.747;-400;100;0;100;367.47];
% ChangeLoop = [0;0;1;0;0;1;1;0;0;1];

% % % % % Problem 1-2
Point = [0;-400;+100;0;100;367.47;36.747;367.47;36.747;-400];
ChangeLoop = [0;0;1;0;0;1;1;0;0;1];
% 
% % % %% Problem 2
% Point = [0;400;-100;367.47;36.747;367.47;0;367.47;400];
% ChangeLoop = [0;0;0;1;0;0;0;0;1];

% % % %% Problem 2-2
% Point = [0;400;-100;367.47;36.747;367.47;0;367.47;400];
% ChangeLoop = [0;0;0;1;0;0;0;0;1];

flag = true;
sigma_A = 0;
epsilon_A = 0;
SigmaGuess = 300;
N = 3000;
%%

%% First Loading
dS = Point(2)-Point(1);
dsigma = -fsolve(@(sigma)LoadFunction(sigma,dS,E,K_Prime,n_Prime,kt),SigmaGuess);
depsilon = ((dsigma)/E)+(dsigma^((1/n_Prime)))/K_Prime^(1/n_Prime); 
epsilon_B = depsilon + epsilon_A;
sigma_B = dsigma + sigma_A; 
y = linspace(sigma_A,sigma_B,N);
for i=1:N
x(i) = y(i)/E+(y(i)/K_Prime)^(1/n_Prime);
end
plot(x(:),y(:),'b','LineWidth',2);
hold on 
m(1) = epsilon_B;
n(1) = sigma_B;
for j=2:length(ChangeLoop)-1
    dS = Point(j+1)-Point(j);
    %% Check Loop
    if(ChangeLoop(j+1) == 1)
        if(flag)
            epsilon_temp = epsilon_B;
            sigma_temp = sigma_B;
            ds_temp = Point(j);
            flag = false;
            if(dS<0)
                epsilon_A = epsilon_B;
                sigma_A = sigma_B;
            else
                epsilon_A = m(1);
                sigma_A = n(1);
            end
        else
            epsilon_A = epsilon_temp;
            sigma_A = sigma_temp;
            dS = Point(j+1) - ds_temp;
            flag = true;
        end
    else
        if(dS<0)
            epsilon_A = epsilon_B;
            sigma_A = sigma_B;
        else
            epsilon_A = m(1);
            sigma_A = n(1);
        end
    end

    if (dS<0)
%% Unloading
        dS = -dS;
        dsigma = fsolve(@(dsigma)UnloadFunction(dsigma,dS,E,K_Prime,n_Prime,kt),SigmaGuess);
        depsilon = ((dsigma)/E)+2*((dsigma/(2*K_Prime))^(1/n_Prime));
        sigma_B = sigma_A - dsigma;
        epsilon_B = epsilon_A - depsilon;    
        n = linspace(sigma_B,sigma_A,N) ;
        m(N) = epsilon_A;
        for i=N:-1:2
        dn = sigma_A - n(i) ;
        dm = dn/E + 2*(dn/(2*K_Prime))^(1/n_Prime);
        m(i-1) =  epsilon_A - dm;
        end
        plot(m(:),n(:),'g','LineWidth',2);
        hold on
    else     
%% Loading
        dsigma = fsolve(@(dsigma)UnloadFunction(dsigma,dS,E,K_Prime,n_Prime,kt),SigmaGuess);
        depsilon = ((dsigma)/E)+2*((dsigma/(2*K_Prime))^(1/n_Prime));
        sigma_B = sigma_A + dsigma;
        epsilon_B = epsilon_A + depsilon;    
        n = linspace(sigma_B,sigma_A,N) ;
        m(1) = epsilon_B;
        for i=1:N-1
        dn = n(i+1) - sigma_A ;
        dm = dn/E + 2*(dn/(2*K_Prime))^(1/n_Prime);
        m(i+1) =  epsilon_A + dm;
        end
        plot(m(:),n(:),'r','LineWidth',2);
        hold on
    end
end