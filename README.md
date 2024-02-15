# Fatigue Life Estimation_Strain-based Method

# Investigation of Loading Effects and Fatigue Life Determination

This phase of the study focuses on investigating the influence of loading on the formation of hysteresis loops. Two distinct types of loading, each with varying peak load directions, have been thoroughly examined.

Furthermore, leveraging the stress concentration coefficients (k_f') derived from the preceding phase and the residual stresses obtained from experimental tests as outlined in reference [1], the objective is to evaluate the fatigue life using both analytical methods and Finite Element Method (FEM) simulations.

To achieve this, the initial step involves the analysis of hysteresis loops associated with the loadings, utilizing the Ramberg-Osgood and Neuber relations. Subsequently, the fatigue life is computed utilizing three distinct methods: Morrow, Modified Morrow, and SWT, based on stress and strain characteristics at each loading point extracted from the hysteresis loop diagram.

In the FEM section, special attention is given to incorporating residual stresses. This is accomplished by simulating the distribution of critical stress, considering the temperature differential range, across varying depths of the critical notch. This simulation aligns with the innovative method proposed in reference [1].

This phase represents a comprehensive investigation into loading effects and fatigue life determination, integrating analytical methods, FEM simulations, and advanced stress analysis techniques.

# Input Date
## Critical notches
The critical notches of an unsmooth surface has been distinguished by implimentation of PSD algorithm. The critical notches and their geometries are provided in Figure 1.

<p align="center">
  <img src="images/Fig_1.PNG" alt="Image Alt Text" width = 500>
</p>
The surface geometry including its notches has been modeled and meshed in Abaqus CAE as Figure 2.
<p align="center">
  <img src="images/Fig_2.PNG" alt="Image Alt Text" width = 500>
</p>
The extracted concentraion factors for each critical notch also are prepared by FEA simulation as Figure 3.
<p align="center">
  <img src="images/Fig_3.PNG" alt="Image Alt Text" width = 500>
</p>


## Loading
Two different loading conditions are considered in order to investigate the effect of loading as Figure 4 and 5.

<p align="center">
  <img src="images/Fig_4.PNG" alt="Image Alt Text" width = 500>
</p>

<p align="center">
  <img src="images/Fig_5.PNG" alt="Image Alt Text" width = 500>
</p>

# Procedure

# Analytical Problem Solving Approach

To address the problem analytically, the following sequential steps have been undertaken:

1. **Cycle Extraction**: The Rainflow Counting method has been employed to extract the cycles in the load, forming the foundational step in the analytical process.

2. **Local Stress and Strain Analysis**: Subsequently, the focus shifted towards extracting the local stress and strain profiles around the critical notch, leading to the extraction of the hysteresis loop.

3. **Fatigue Life Determination**: The fatigue life of each cycle has been determined using three primary methods: Morrow, Modified Morrow, and SWT, providing comprehensive insight into the durability of the material under cyclic loading conditions.

4. **Block Loading Fatigue Life**: The fatigue life of block type 1 and 2 loadings has been assessed utilizing the Palmgren-Miner relationship, enriching the analytical approach with a holistic understanding of fatigue behavior under varying loading scenarios.

These sequential steps represent a systematic and comprehensive analytical approach to addressing the problem at hand, integrating advanced methodologies for cycle extraction, stress analysis, fatigue life determination, and block loading assessment.


## Results & Additional Information
For further details (including related equations, additional data and results) and/or an in-depth discussion, please feel free to [reach out to me](mailto:fateme.s.ahangari@gmail.com). I am available to provide additional information related to topic.


## References
1. Reference [1]: Numericalmodelling approach for considering effects of surface integrity on micro-crack formation.
