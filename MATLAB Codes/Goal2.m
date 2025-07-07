clear all;
close all;
clc;

%% Frequency Spectrum of each instrument from final.wav

[x,Fs] = audioread('final.wav');
t = 0:1/Fs:(length(x)-1)/Fs;



N = 1024; %N point FFT
X = fft(x);
X_shift = fftshift(X);


f = linspace(-Fs/2, Fs/2, length(x));


figure(1)
subplot(211)
plot(t,x);
subplot(212)
plot(f,abs(X_shift));

