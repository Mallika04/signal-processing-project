[music, Fs] = audioread("vocal_music.wav");
figure();
plot(abs(fftshift(fft(music))));
title('Absolute value of fft of orignal music');
[tablas] = audioread("Tabla.wav");
tablasignal=[tablas(:, 1); zeros(-length(tablas(:, 1))+length(music(:, 1)), 1)];
tabla = tablasignal;
musicsignal = music(:, 1);
musicsignal = musicsignal/norm(musicsignal);
tabla = tabla/norm(tabla);
maxm = max(max(abs(tabla), max(abs(musicsignal))));
tabla = tabla/maxm;
musicsignal = musicsignal/maxm;

%%%% part for stft
windowLength = 128;
fftLength = 512;
overlapLength = 96;
win = hann(windowLength,"periodic");



tablaSTFT = stft(tabla, Fs, Window=win,OverlapLength=overlapLength,FFTLength=fftLength,FrequencyRange="onesided");
MUSICSIGNALSTFT = stft(musicsignal, Fs, Window=win,OverlapLength=overlapLength,FFTLength=fftLength,FrequencyRange="onesided");


bin_classifier = abs(tablaSTFT) >= abs(MUSICSIGNALSTFT);

classified_voice_ft = MUSICSIGNALSTFT.*(bin_classifier);
classified_voice = istft(classified_voice_ft,Window=win,OverlapLength=overlapLength,FFTLength=fftLength,FrequencyRange="onesided");
% sound(classified_voice, Fs);

figure();
plot(abs(fftshift(fft(classified_voice))));
title('Absolute value of fft of separated tabla voice');

% pause(30);
% sound(10*classified_voice, Fs);


