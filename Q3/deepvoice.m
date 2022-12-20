clear;
clc;

[music, Fs] = audioread("vocal_music.wav");
musicsignal=[music(:, 1)];
figure();
plot(abs(fftshift(fft(musicsignal))));
musicsignal = musicsignal/norm(musicsignal);
maxm = max(abs(musicsignal));
musicsignal = musicsignal/maxm;

%%%% part for stft

[b, a] = butterbp(4000, 6000,  Fs);
z = filter(b, a, musicsignal);
figure();
plot(abs(fftshift(fft(z))));
title('Absolute value of fft of separated deep voice');
% sound(10*z, Fs);
% 
% pause(30);
% sound(20*z, Fs);