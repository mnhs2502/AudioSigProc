clear all;
close all;
clc;


%% Load separated audio files
[guitar, fs] = audioread('guitar_ext.wav');
[trumpet, ~] = audioread('trumpet_ext.wav');

%% Define carrier frequencies
carrier1 = 5131; % Hz (from the student's ID)
carrier2 = 15000; % Hz

%% Modulate signals onto carriers
t = (0:length(guitar)-1)/fs; % Time vector
modulated1 = guitar .* cos(2*pi*carrier1*t).' + trumpet .* sin(2*pi*carrier1*t).';

%% Write modulated signals to file
audiowrite('modulated1.wav', modulated1, fs);


[x_guitar, Fs1] = audioread('modulated1.wav');
[x_trumpet, Fs2] = audioread('modulated2.wav');

X_guitar = fft(x_guitar);
X_guitar = X_guitar/Fs1;
X_guitar_shift = fftshift(X_guitar);

X_trpt = fft(x_trumpet);
X_trpt = X_trpt/Fs2;
X_trpt_shift = fftshift(X_trpt);

Y = X_guitar_shift + X_trpt_shift;

f1 = linspace(-Fs1/2, Fs1/2, length(x_guitar));
f2 = linspace(-Fs2/2, Fs2/2, length(x_trumpet));

figure(1)
plot(f2,abs(Y),'Linewidth',2);
title('FDM Signal of Guitar and Trumpet at 5131Hz and 15000Hz Respectively');


