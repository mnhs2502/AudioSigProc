clear all;
close all;
clc;

%Goal1 and Splitting Sound of different intrument from Time domain


%% Generating Signal in Time Domain from NonOverlapping

fs1 = 90e3;
[x,Fs] = audioread('NonOverlapping.wav');
t = 0:1/Fs:(length(x)-1)/Fs;


%% Splitting Signals in Time Domain from NonOverlapping


%Trumpet (0~ 13.3375sec)
index_trpt = and(t>=0 , t <= 13.3375);
t_trpt = t(index_trpt);
x_trpt = x(index_trpt);


filename1 = 'trumpet.wav';
audiowrite(filename1, x_trpt, fs1);




%Piano (13.35~33.5885sec)
index_piano = and(t>=13.35 , t <= 33.588);
t_piano = t(index_piano);
x_piano = x(index_piano);

filename2 = 'piano.wav';
audiowrite(filename2, x_piano, fs1);



%Violin (33.600~49.9643sec)
index_violin = and(t>=33.600 , t <= 49.9643);
t_violin = t(index_violin);
x_violin = x(index_violin);

filename3 = 'violin.wav';
audiowrite(filename3, x_violin, fs1);


%Guitar (50.00~58.1965sec)
index_guitar = and(t>=50.00 , t <= 58.1965);
t_guitar = t(index_guitar);
x_guitar = x(index_guitar);

filename4 = 'guitar.wav';
audiowrite(filename4, x_guitar, fs1);

figure(2)
subplot(421)
plot(t_trpt,x_trpt);
xlim([0,(length(x)-1)/Fs]);
ylabel('Amplitude(Trumpet)');
xlabel('Time(Sec.)');


subplot(423)
plot(t_piano,x_piano);
xlim([0,(length(x)-1)/Fs]);
ylabel('Amplitude(Piano)');
xlabel('Time(Sec.)');


subplot(425)
plot(t_violin,x_violin);
xlim([0,(length(x)-1)/Fs]);
ylabel('Amplitude(Violin)');
xlabel('Time(Sec.)');

subplot(427)
plot(t_guitar,x_guitar);
xlim([0,(length(x)-1)/Fs]);
ylabel('Amplitude(Guitar)');
xlabel('Time(Sec.)');




%% Transforming the signal in Time Domain to Frequency Domain

N = 1024; %N point FFT


X1 = fft(x_trpt);
X1 = X1/Fs;
X1_shift = fftshift(X1);

X2 = fft(x_piano);
X2 = X2/Fs;
X2_shift = fftshift(X2);

X3 = fft(x_violin);
X3 = X3/Fs;
X3_shift = fftshift(X3);

X4 = fft(x_guitar);
X4 = X4/Fs;
X4_shift = fftshift(X4);

f = linspace(-Fs/2, Fs/2, length(x));

f1 = linspace(-Fs/2, Fs/2, length(x_trpt));
f2 = linspace(-Fs/2, Fs/2, length(x_piano));
f3 = linspace(-Fs/2, Fs/2, length(x_violin));
f4 = linspace(-Fs/2, Fs/2, length(x_guitar));

figure(2)
subplot(422)
plot(f1,X1_shift);
ylabel('Frequency Responce(Trumpet)');
xlabel('Frequency(Hz)');

subplot(424)
plot(f2,X2_shift);
ylabel('Frequency Responce(Piano)');
xlabel('Frequency(Hz)');

subplot(426)
plot(f3,X3_shift);
ylabel('Frequency Responce(Violin)');
xlabel('Frequency(Hz)');

subplot(428)
plot(f4,X4_shift);
ylabel('Frequency Responce(Guitar)');
xlabel('Frequency(Hz)');









