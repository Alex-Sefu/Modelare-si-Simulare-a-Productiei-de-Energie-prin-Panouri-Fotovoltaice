function I = pv_model_func(V, G, T)

    % Parametri panou (valori exemplu - pot fi modificați după panoul tău real)
    persistent I_sc V_oc N_s k q n R_s R_p
    if isempty(I_sc)
        I_sc = 8.75;     % [A]
        V_oc = 37.6;     % [V]
        N_s = 60;        % Număr celule
        k = 1.3806e-23;  % [J/K]
        q = 1.6022e-19;  % [C]
        n = 1.3;         % Factor idealitate
        R_s = 0.2;       % [Ω]
        R_p = 100;       % [Ω]
    end

    % Calcule intermediare
    I_ph = (G / 1000) * I_sc;
    V_T = (k * (T + 273.15)) / q;
    I_0 = I_sc / (exp(V_oc / (n * N_s * V_T)) - 1);

    % Newton-Raphson
    I = I_ph;
    for iter = 1:20
        f = I - I_ph + I_0 * (exp((V + I * R_s) / (n * N_s * V_T)) - 1) + (V + I * R_s) / R_p;
        df = 1 + I_0 * exp((V + I * R_s) / (n * N_s * V_T)) * (R_s / (n * N_s * V_T)) + R_s / R_p;
        I = I - f / df;
    end
end
