clear all;
close all;
clc;

[x,Fs1] = audioread('NonOverlapping.wav');
t = 0:1/Fs1:(length(x)-1)/Fs1;

[x_fin,Fs_fin] = audioread('final.wav');
t1 = 0:1/Fs_fin:(length(x_fin)-1)/Fs_fin;



X_fin = fft(x_fin);
X_fin = X_fin/Fs_fin;
Xfin_shift = fftshift(X_fin);
f_fin = linspace(-Fs_fin/2, Fs_fin/2, length(x_fin));

%Extracting Trumpet
filter1=designfilt('lowpassfir','PassbandFrequency',2000,'StopbandFrequency',2100,'PassbandRipple',1,'StopbandAttenuation',95,'SampleRate',Fs_fin);
xtrpt_ext=filter(filter1,x_fin);
filename1 = 'trumpet_ext.wav';
audiowrite(filename1, xtrpt_ext, Fs_fin);

filter2=designfilt('bandpassfir','FilterOrder',30,'CutoffFrequency1',3400,'CutoffFrequency2',6700,'SampleRate',Fs_fin);
xpiano_ext=filter(filter2,x_fin);
filename2 = 'piano_ext.wav';
audiowrite(filename2, xpiano_ext, Fs_fin);

filter3=designfilt('bandpassfir','FilterOrder',20,'CutoffFrequency1',5851,'CutoffFrequency2',15202,'SampleRate',Fs_fin);
xviolin_ext=filter(filter3,x_fin);
filename3 = 'violin_ext.wav';
audiowrite(filename3, xviolin_ext, Fs_fin);

filter4=designfilt('highpassfir','PassbandFrequency',18000,'StopbandFrequency',17900,'PassbandRipple',1,'StopbandAttenuation',80,'SampleRate',Fs_fin);
xguitar_ext=filter(filter4,x_fin);
filename3 = 'guitar_ext.wav';
audiowrite(filename3, xguitar_ext, Fs_fin);



Xtrpt_ext = fft(xtrpt_ext);
Xtrpt_ext = Xtrpt_ext/Fs_fin;
Xtrpt_ext_shift = fftshift(Xtrpt_ext);

Xpiano_ext = fft(xpiano_ext);
Xpiano_ext = Xpiano_ext/Fs_fin;
Xpiano_ext_shift = fftshift(Xpiano_ext);

Xviolin_ext = fft(xviolin_ext);
Xviolin_ext = Xviolin_ext/Fs_fin;
Xviolin_ext_shift = fftshift(Xviolin_ext);

Xguitar_ext = fft(xguitar_ext);
Xguitar_ext = Xguitar_ext/Fs_fin;
Xguitar_ext_shift = fftshift(Xguitar_ext);
% f_trpt = linspace(-Fs_fin/2, Fs_fin/2, length(xtrpt_ext));

f1 = linspace(-Fs_fin/2, Fs_fin/2, length(xtrpt_ext));
f2 = linspace(-Fs_fin/2, Fs_fin/2, length(xpiano_ext));
f3 = linspace(-Fs_fin/2, Fs_fin/2, length(xviolin_ext));
f4 = linspace(-Fs_fin/2, Fs_fin/2, length(xguitar_ext));

figure(1)
subplot(422)
plot(f1,Xtrpt_ext_shift);
ylabel('Amp(Trumpet)');
xlabel('Frequency(Hz)');

subplot(424)
plot(f2,Xpiano_ext_shift);
ylabel('Amp(Piano)');
xlabel('Frequency(Hz)');

subplot(426)
plot(f3,Xviolin_ext_shift);
ylabel('Amp(Violin)');
xlabel('Frequency(Hz)');

subplot(428)
plot(f4,Xguitar_ext_shift);
ylabel('Amp(Guitar)');
xlabel('Frequency(Hz)');


figure(1)
subplot(421)
plot(t1,xtrpt_ext);
xlim([0,(length(x_fin)-1)/Fs_fin]);
ylabel('Amplitude(Trumpet)');
xlabel('Time(Sec.)');


subplot(423)
plot(t1,xpiano_ext);
xlim([0,(length(x_fin)-1)/Fs_fin]);
ylabel('Amplitude(Piano)');
xlabel('Time(Sec.)');


subplot(425)
plot(t1,xviolin_ext);
xlim([0,(length(x_fin)-1)/Fs_fin]);
ylabel('Amplitude(Violin)');
xlabel('Time(Sec.)');

subplot(427)
plot(t1,xguitar_ext);
xlim([0,(length(x_fin)-1)/Fs_fin]);
ylabel('Amplitude(Guitar)');
xlabel('Time(Sec.)');


% 
% plot(t2, xtrpt_ext)



% nfft1=2^nextpow2(length(fSignal1));
% filtered1=fs1/2*linspace(0,1,nfft1/2+1);
% y3=abs(fft(fSignal1,nfft1));
% figure(5);
% subplot(221);
% plot(filtered1,y3(1:nfft1/2+1));
% title('Guitar')
% audiowrite('Guitar.wav',fSignal1,fs1);