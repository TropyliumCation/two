% M-file, mag_field_partb.m  
% Simulating the interaction of a one-loop rotor's magnetic field  
% with the rotating magnetic field of the stator.  

% Set up the basic conditions  
bmax = 1; % Normalize bmax to 1  
freq = 60; % 60 Hz  
w = 2 * pi * freq; % Angular velocity (rad/s)  

% Generate time array  
t = 0:1/6000:1/60;  

% Stator magnetic fields  
Baa = sin(w * t) .* (cos(0) + 1i * sin(0));  
Bbb = sin(w * t - 2 * pi / 3) .* (cos(2 * pi / 3) + 1i * sin(2 * pi / 3));  
Bcc = sin(w * t + 2 * pi / 3) .* (cos(-2 * pi / 3) + 1i * sin(-2 * pi / 3));  

% Net rotating magnetic field of the stator  
Bnet = Baa + Bbb + Bcc;  

% Rotor's magnetic field (assumed to lag slightly due to slip)  
Brotor = cos(w*t+0)+ 1i * sin(w*t+0);  

% Circle representing the expected maximum field value  
circle = 1.5 * (cos(w * t) + 1i * sin(w * t));  

% Plot the fields dynamically  
for ii = 1:length(t)  
    clf; % Clear figure for animation  
    hold on;

    % Plot reference circle
    plot(circle, 'k');  

    % Plot stator and rotor magnetic fields  
    %plot([0 real(Baa(ii))], [0 imag(Baa(ii))], 'k', 'LineWidth', 2);  
    %plot([0 real(Bbb(ii))], [0 imag(Bbb(ii))], 'b', 'LineWidth', 2);  
    %plot([0 real(Bcc(ii))], [0 imag(Bcc(ii))], 'm', 'LineWidth', 2);  
    plot([0 real(Bnet(ii))], [0 imag(Bnet(ii))], 'r', 'LineWidth', 3); % Net stator field  
    plot([0 real(Brotor(ii))], [0 imag(Brotor(ii))], 'g', 'LineWidth', 3); % Rotor field  

    % Formatting
    axis square;
    axis([-2 2 -2 2]);  
    drawnow;  
    hold off;  
end  
