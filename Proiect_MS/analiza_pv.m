% Script de analiză și vizualizare pentru simularea panoului PV

% Rulează simularea
simOut = sim('pv_model.slx');  % Asigură-te că numele fișierului este .slx

% Extrage datele din structuri
V = simOut.V.Data;
I = simOut.I.Data;
t = simOut.V.Time;
P = V .* I;

% Afișare grafice
figure;

% Tensiune și Curent în timp
subplot(2,1,1);
plot(t, V, 'b', t, I, 'r', 'LineWidth', 1.5);
title('Variația tensiunii și curentului în timp');
xlabel('Timp (s)');
ylabel('Valoare');
legend('Tensiune (V)', 'Curent (I)');
grid on;

% Caracteristica Putere-Tensiune (P-V)
subplot(2,1,2);
plot(V, P, 'k', 'LineWidth', 1.5);
title('Caracteristica Putere-Tensiune (P-V)');
xlabel('Tensiune (V)');
ylabel('Putere (W)');
grid on;
