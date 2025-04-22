% Parameters
i_a = linspace(0, 60, 21);  % Line current from 0 to 60 A
v_phase = zeros(1, 21);  % Array to store phase voltage
x_s = 1.0;  % Synchronous reactance
e_a = 277.0;  % Internal voltage
theta_lagging = acos([0.2, 0.4, 0.6, 0.8]);  % Power factors for lagging
theta_leading = acos([-0.2, -0.4, -0.6, -0.8]);  % Power factors for leading

% Initialize plot
figure;
hold on;

% Loop for lagging power factors (0.2, 0.4, 0.6, 0.8)
for pf = theta_lagging
    for ii = 1:21
        real_part = e_a - x_s * i_a(ii) * cos(pf);  % Real part of voltage
        img_part = x_s * i_a(ii) * sin(pf);  % Imaginary part of voltage
        v_phase(ii) = sqrt(real_part^2 + img_part^2);  % Phase voltage magnitude
    end
    v_t = v_phase * sqrt(3);  % Line voltage
    plot(i_a, v_t, 'LineWidth', 2.0);
end

% Loop for leading power factors (-0.2, -0.4, -0.6, -0.8)
for pf = theta_leading
    for ii = 1:21
        real_part = e_a - x_s * i_a(ii) * cos(pf);  % Real part of voltage
        img_part = x_s * i_a(ii) * sin(pf);  % Imaginary part of voltage
        v_phase(ii) = sqrt(real_part^2 + img_part^2);  % Phase voltage magnitude
    end
    v_t = v_phase * sqrt(3);  % Line voltage
    plot(i_a, v_t, '--', 'LineWidth', 2.0);  % Dotted line for leading power factor
end

% Customize plot
xlabel('Line Current (A)', 'FontWeight', 'Bold');
ylabel('Terminal Voltage (V)', 'FontWeight', 'Bold');
title('Terminal Characteristics for Various Power Factors', 'FontWeight', 'Bold');
legend({'p.f. 0.2 Lagging', 'p.f. 0.4 Lagging', 'p.f. 0.6 Lagging', 'p.f. 0.8 Lagging', ...
        'p.f. 0.2 Leading', 'p.f. 0.4 Leading', 'p.f. 0.6 Leading', 'p.f. 0.8 Leading'}, ...
        'Location', 'Best', 'FontWeight', 'Bold');
grid on;
axis([0 60 400 550]);
hold off;
