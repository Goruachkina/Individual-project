clear;
clc;

myLineWidth = 1;
myBackgroundColor = [1 1 1];
myFontSize = 14;
myFontName = 'times new roman';

R1 = 2;
R2 = 1.5;
Uist_cons = 5;
Uist_par = 5;
Rh = [0, 10, 20, 30, 40, 50, 60];
l = length(Rh);

for a = 1:l
    Rh_cons = Rh(a);
    Rh_par = Rh(a);
    sim("MyProjectPicture.slx");
    New_I_cons(:, a) = I_cons.signals.values(length(I_cons.signals.values));
    New_U1_cons(:, a) = U1_cons.signals.values(length(U1_cons.signals.values));
    New_U2_cons(:, a) = U2_cons.signals.values(length(U2_cons.signals.values));
    New_U_cons(:, a) = U_cons.signals.values(length(U_cons.signals.values));

    New_I_par(:, a) = I_par.signals.values(length(I_par.signals.values));
    New_I1_par(:, a) = I1_par.signals.values(length(I1_par.signals.values));
    New_I2_par(:, a) = I2_par.signals.values(length(I2_par.signals.values));
    New_U_par(:, a) = U_par.signals.values(length(U_par.signals.values));
end

figure('units', 'normalized', 'outerposition', [0 0 1 1], 'color', myBackgroundColor)
subplot(2, 1, 1)
plot(New_U1_cons,New_I_cons,New_U2_cons,New_I_cons,New_U_cons,New_I_cons, "linewidth", myLineWidth)
legend('R1','R2', 'R параллельное')
clear xlim
xlim([0,3])
clear ylim
ylim([0,1.5])
grid on
grid minor
xlabel('Ток через резистор, А')
ylabel('Напряжение на резисторе, В')
set(gca, 'fontsize', myFontSize)
set(gca, 'fontname', myFontName)
title('Параллельное соединение')

subplot(2, 1, 2)
plot(New_U_par,New_I1_par,New_U_par,New_I2_par, New_U_par,New_I_par,"linewidth", myLineWidth)
legend('R1','R2', 'R последовательное')
clear xlim
xlim([0,3])
clear ylim
ylim([0,1.5])
grid on
grid minor
xlabel('Ток через резистор, А')
ylabel('Напряжение на резисторе, В')
set(gca, 'fontsize', myFontSize)
set(gca, 'fontname', myFontName)
title('Последовательное соединение')
