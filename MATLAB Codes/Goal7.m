[x_fin,Fs_fin] = audioread('final.wav');
t1 = 0:1/Fs_fin:(length(x_fin)-1)/Fs_fin;

X_fin = fft(x_fin);
X_fin = X_fin/Fs_fin;
Xfin_shift = fftshift(X_fin);
f_fin = linspace(-Fs_fin/2, Fs_fin/2, length(x_fin));


plot(f_fin,Xfin_shift);
% xlim([0,(length(x_fin)-1)/Fs_fin]);
% ylabel('Amplitude(Guitar)');
% xlabel('Time(Sec.)');