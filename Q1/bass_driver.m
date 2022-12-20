[y, Fs] = audioread("equalizer_bass.mp3");
figure();
plot(abs(fftshift(fft(y))));
M = 6;
gain = [10, 1, 1, 1, 1, 1];
r = equalize_bass(M, gain, y, Fs);
sound(10*r, Fs);