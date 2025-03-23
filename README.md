

# Spring Constant Simulation: Temperature and Time Dependence with Nonlinear Response

This MATLAB project simulates the behavior of a spring constant as a function of temperature and time. It includes both linear and nonlinear models for material behavior, specifically incorporating a nonlinear response for temperatures below 0°C. The simulation also accounts for time-dependent degradation of the material properties.



## Files

- **`spring_constant_simulation.m`**  
  MATLAB script that performs the simulation and generates two plots:
  1. Spring constant vs. temperature.
  2. Spring constant vs. time for selected temperatures.


## Prerequisites

- MATLAB (R2018b or later recommended)
- Basic knowledge of MATLAB scripting

## How to Run



1. **Open MATLAB and navigate to the project directory.**

2. **Run the Script:**

   In the MATLAB command window, type:

   ```matlab
   run('SpringConstant.m')
   ```

3. **View the Generated Plots:**

   Two figures will be produced:
   - The first plot shows the variation of the spring constant with temperature.
   - The second plot shows the evolution of the spring constant with time at selected temperatures.

## Model Parameters

The following parameters are defined in the script:
- **\(E_0\)**: Reference Young's modulus (200 GPa typical for steel)
- **\(A_0\)**: Cross-sectional area
- **\(L_0\)**: Original length
- **\(T_0\)**: Reference temperature (20°C)
- **\(\alpha\)**: Thermal expansion coefficient
- **\(\beta\)**: Linear temperature coefficient for Young's modulus
- **\(\gamma\)**: Coefficient for nonlinear response for \(T < 0\)
- **\(\lambda\)**: Degradation constant for the time-dependent exponential decay

Feel free to adjust these parameters to match your experimental data or material of interest.

## References

1. Callister, W.D. and Rethwisch, D.G., *Materials Science and Engineering: An Introduction*.
2. Budynas, R.G. and Nisbett, J.K., *Shigley's Mechanical Engineering Design*.
3. Hibbeler, R.C., *Mechanics of Materials*.
4. Mott, N.F., *Temperature Dependence of Elastic Moduli in Metals*, Journal of Physics, 1962.
5. Boyer, R.R., *An Introduction to the Mechanical Behavior of Materials*, John Wiley & Sons, 1990.
6. Schapery, R.A., *Nonlinear viscoelasticity: A constitutive model and its application to polymers*, Journal of Applied Mechanics, 1969.
7. Ferry, J.D., *Viscoelastic Properties of Polymers*, Wiley, 1980.

