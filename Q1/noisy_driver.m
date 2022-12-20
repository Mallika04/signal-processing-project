[y, Fs] = audioread("equalizer_noisy.wav");
plot(abs(fft(y)));
figure();
plot(abs(fftshift(fft(y))));
M = 6;
gain = [0, 1, 1, 1, 1, 1];
r = equalize(M, gain, y, Fs);
sound(10*r, Fs);