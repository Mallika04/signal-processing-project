function result = equalize(M, y, x, Fs)
band = 0:((Fs/2))/6:Fs/2;
disp(band)
%%% for the first band

[b, a] = buttlow(band(2),  Fs);
dummy_data = filter(b, a, x);
figure();
freqz(b, a);

composite_data = dummy_data * y(1);

%%% for the second band
[b, a] = butterp(band(2),band(3),Fs);
dummy_data = filter(b, a ,x);
composite_data = composite_data + dummy_data * y(2);
freqz(b, a);
%%% for the third band
[b, a] = butterp(band(3),band(4),Fs);
dummy_data = filter(b, a ,x);
composite_data = composite_data + dummy_data * y(3);
figure();
freqz(b, a);

%%% for the fourth band
[b, a] = butterp(band(4),band(5),Fs);
dummy_data = filter(b, a ,x);
composite_data = composite_data + dummy_data * y(4);
figure();
freqz(b, a);

%%% for the fifth band
[b, a] = butterp(band(5),band(6),Fs);
dummy_data = filter(b, a ,x);
composite_data = composite_data + dummy_data * y(5);
figure();
freqz(b, a);

%%% for the sixth band
[b, a] = butthigh(band(6), Fs);
dummy_data = filter(b, a,x);
composite_data = composite_data + dummy_data * y(6);
figure();
freqz(b, a);

result = composite_data;
end
