[y, Fs] = audioread("treble.mp3");
figure();
plot(abs(fftshift(fft(y))));
M = 6;
gain = [1, 1, 1, 50, 50, 50];
r = equalize(M, gain, y, Fs);
sound(10*r, Fs);