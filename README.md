# InfectionModelling
IntracellularModel folder contains a Fortran code that is used for the simulation of the intracellular infection of single cell with SARS-CoV-2, corresponding to the paper submitted to Royal Society Open Science. This stochastic model uses a Gillespie algorithm. The code is written in Fortran 90 and can be compiled using gfortran. The -O4 flag should be used to optimise the executable output.
This code as currently configured runs 1 repeat of the treatment-free control case. The results are written to the file "A.dat"

On a desktop computer (~2Ghz processor) the code should take around 10mins to run and uses <1Gb of RAM.

IntercellularModel folder contains Matlab codes that are used for the simulation and analysis of the COVID-19 within-host infection in the presence and absence of treatment. 

Treatment_no_delay.m solves the system in the presence and absence of Remdesivir therapy and creates Fig. 3.

CP_therapy_and_Synergy.m solves the system in the presence and absence of convalescent plasma (CP) therapy and explore the synergistic effect between CP and Remdesivir therapy.

CP_treatment_analysis.m analyses the impact of changing of the treatment start and efficacy of the CP therapy on the level of area under curve (AUC).

min_search.m uses fminsearch function to fit the intercellular model to patient data.

These codes are available for use by anyone, however if in an academic context, we would appreciate a citation; the details of which will be added following publication of the paper.
