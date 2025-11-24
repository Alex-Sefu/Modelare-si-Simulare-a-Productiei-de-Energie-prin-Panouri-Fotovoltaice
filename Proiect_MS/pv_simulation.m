% 1. Rulează simularea și salvează rezultatele corect
simOut = sim('pv_model'); % Înlocuiește cu numele tău real

% 2. Extrage datele folosind structura corectă
V = simOut.V.Data;       % Semnalul de tensiune
I = simOut.I.Data;       % Semnalul de curent
t = simOut.V.Time;       % Timpul de simulare
P = V .* I;              % Puterea calculată

% 3. Plotare grafică
figure;

% Graficul 1: V și I în timp
subplot(2,1,1);
plot(t, V, 'b', t, I, 'r', 'LineWidth', 1.5);
title('Variația tensiunii și curentului în timp');
xlabel('Timp (s)');
ylabel('Valoare');
legend('Tensiune (V)', 'Curent (I)');
grid on;

% Graficul 2: Caracteristica P-V
subplot(2,1,2);
plot(V, P, 'k', 'LineWidth', 1.5);
title('Caracteristica Putere-Tensiune (P-V)');
xlabel('Tensiune (V)');
ylabel('Putere (W)');
grid on;