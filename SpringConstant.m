%% MATLAB Script: Nonlinear Material Response for T < 0°C with Temperature & Time Dependence
% This script computes and plots the spring constant k as a function of temperature T
% and also shows the time evolution of k at selected temperatures, including a nonlinear
% response for T < 0°C.
%
% Temperature dependence:
% For T >= 0°C:
%   E(T) = E0 * (1 - beta*(T - T0))
%
% For T < 0°C (nonlinear response introduced):
%   E(T) = E0 * (1 - beta*(T - T0)) * (1 + gamma*T^2)
%
% Length and area change linearly:
%   L(T) = L0 * (1 + alpha*(T - T0))
%   A(T) = A0 * (1 + 2*alpha*(T - T0))
%
% Therefore:
%   k(T) = (E(T)*A(T)) / L(T)
%
% Time dependence (short time, seconds scale):
%   E(T,t) = E(T) * exp(-lambda*t)
%   k(T,t) = (E(T,t)*A(T)) / L(T)
%
% Material parameters (typical for steel) and model parameters:
E0 = 200e9;       % Young's modulus at T0 [Pa]
A0 = 1e-4;        % Cross-sectional area [m^2] (e.g., 10 mm x 10 mm)
L0 = 0.5;         % Original length [m]
T0 = 20;          % Reference temperature [°C]
alpha = 12e-6;    % Coefficient of thermal expansion [1/°C]
beta = 0.0005;    % Coefficient for linear temperature dependence of E [1/°C]
gamma = 1e-4;     % Coefficient for nonlinear (quadratic) response for T < 0°C

%% PART 1: Spring Constant vs Temperature with Nonlinear Response for T < 0°C
% Define a temperature range from -80°C to 150°C.
T = linspace(-80, 150, 200); % Temperature vector in °C
k_T = zeros(size(T));       % Preallocate spring constant array

for i = 1:length(T)
    % Use a piecewise definition for E(T)
    if T(i) >= 0
        E_T = E0 * (1 - beta * (T(i) - T0));
    else
        % For T < 0, add a nonlinear quadratic term (T^2 is always positive)
        E_T = E0 * (1 - beta * (T(i) - T0)) * (1 + gamma * T(i)^2);
    end
    
    % Temperature-adjusted length and cross-sectional area (linear model)
    L_T = L0 * (1 + alpha * (T(i) - T0));
    A_T = A0 * (1 + 2 * alpha * (T(i) - T0));
    
    % Compute spring constant: k = (E*A)/L
    k_T(i) = (E_T * A_T) / L_T;
end

% Plot spring constant vs temperature
figure;
plot(T, k_T, 'LineWidth', 2);
xlabel('Temperature (°C)');
ylabel('Spring Constant (N/m)');
title('Spring Constant vs Temperature (Nonlinear Response for T < 0°C)');
grid on;

%% PART 2: Spring Constant vs Time for Selected Temperatures (Seconds Scale)
% Degradation is modeled as an exponential decay:
%   E(T,t) = E(T) * exp(-lambda*t)
lambda = 1e-3;   % Degradation constant [1/s]

% Define a time range (0 to 100 seconds)
time = linspace(0, 100, 100); % Time vector in seconds

% Select a set of representative temperatures (more than five)
T_selected = [-80,-40, -10, 0, 20, 50, 100, 150];  % in °C
k_time = zeros(length(T_selected), length(time)); % Preallocate k vs time

for j = 1:length(T_selected)
    T_val = T_selected(j);
    
    % Use the piecewise model for E(T) at the selected temperature
    if T_val >= 0
        E_T = E0 * (1 - beta * (T_val - T0));
    else
        E_T = E0 * (1 - beta * (T_val - T0)) * (1 + gamma * T_val^2);
    end
    
    % Temperature-adjusted length and area (linear)
    L_T = L0 * (1 + alpha * (T_val - T0));
    A_T = A0 * (1 + 2 * alpha * (T_val - T0));
    
    for i = 1:length(time)
        % Time-dependent Young's modulus with degradation
        E_T_time = E_T * exp(-lambda * time(i));
        % Compute the spring constant with time dependence
        k_time(j, i) = (E_T_time * A_T) / L_T;
    end
end

% Plot spring constant vs time for the selected temperatures
figure;
hold on;
for j = 1:length(T_selected)
    plot(time, k_time(j, :), 'LineWidth', 2, 'DisplayName', sprintf('T = %d°C', T_selected(j)));
end
xlabel('Time (seconds)');
ylabel('Spring Constant (N/m)');
title('Spring Constant vs Time for Selected Temperatures');
grid on;
legend('show');
hold off;

%% References:
% [1] Callister, W.D. and Rethwisch, D.G., "Materials Science and Engineering: An Introduction".
% [2] Budynas, R.G. and Nisbett, J.K., "Shigley's Mechanical Engineering Design".
% [3] Hibbeler, R.C., "Mechanics of Materials".
% [4] Mott, N.F., "Temperature Dependence of Elastic Moduli in Metals", Journal of Physics, 1962.
% [5] Boyer, R.R., "An Introduction to the Mechanical Behavior of Materials", John Wiley & Sons, 1990.
% [6] Schapery, R.A., "Nonlinear viscoelasticity: A constitutive model and its application to polymers", Journal of Applied Mechanics, 1969.
% [7] Ferry, J.D., "Viscoelastic Properties of Polymers", Wiley, 1980.
