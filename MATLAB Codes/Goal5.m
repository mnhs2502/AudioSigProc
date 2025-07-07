

[x_fin,Fs_fin] = audioread('final.wav');
t1 = 0:1/Fs_fin:(length(x_fin)-1)/Fs_fin;


filter1=designfilt('lowpassfir','PassbandFrequency',0,'StopbandFrequency',10000,'PassbandRipple',1,'StopbandAttenuation',95,'SampleRate',Fs_fin);
x_filtered=filter(filter1,x_fin);
filename1 = 'filteredsignal.wav';
audiowrite(filename1, x_filtered, Fs_fin);


X_filtered = fft(x_filtered);
X_filtered = X_filtered/Fs_fin;
X_filtered_shift = fftshift(X_filtered);

f1 = linspace(-Fs_fin/2, Fs_fin/2, length(x_filtered));

figure(1)
plot(f1,X_filtered_shift);
ylabel('Amp(Trumpet)');
xlabel('Frequency(Hz)');