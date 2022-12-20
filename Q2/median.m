clear;
clc;

a = arduino();

%%%%%%%%%%%%%%%%%%%%%% 2.mp4 %%%%%%%%%%%%%%%

N = 100;
[n,Fs]=audioread('2n.mp4');

y=zeros(1,length(n));
for k=1:length(n)-N
    A=n(k:k+N);
    sort(A);
    if (rem(N,2)==0)
        y(k)=(A(N/2)+A(N/2+1))/2;
    else
        y(k)=A((N+1)/2);
    end
end
subplot(4,1,1);
sound(y,Fs);
plot(fftshift(abs(fft(y))));
title("2.mp4");
max=0;
demo=abs(fft(y));
for k=1:length(demo)
    if (demo(k)>max)
        max=demo(k);
        index=k;
    end

end
if index>150
    disp("pad");
    writePWMVoltage(a,'D9',1); % Red
    writePWMVoltage(a,'D6',0);
else
    disp("bat");
    writePWMVoltage(a,'D9',0); % Green
    writePWMVoltage(a,'D6',1); 
end

N = 300;
[n,Fs]=audioread('1.mp4');
y=zeros(1,length(n));
for k=1:length(n)-N
    A=n(k:k+N);
    sort(A);
    if (rem(N,2)==0)
        y(k)=(A(N/2)+A(N/2+1))/2;
    else
        y(k)=A((N+1)/2);
    end
end
subplot(4,1,2);
plot(fftshift(abs(fft(y))))
title("1.mp4");

max=0;
index=0;
demo=abs(fft(y));
for k=1:length(demo)
    if (demo(k)>max)
        max=demo(k);
        index=k;
    end

end

if index>150
    disp("pad");
    writePWMVoltage(a,'D9',1); % Red
    writePWMVoltage(a,'D6',0);
else
    disp("bat");
    writePWMVoltage(a,'D9',0); % Green
    writePWMVoltage(a,'D6',1); 
end

%%%%%%%%%%%%%%%%%%%%%%%%% 1n.mp4 %%%%%%%%%%%%%%%%%%

N = 300;
[n,Fs]=audioread('1n.mp4');
p=length(n);
y=zeros(1,length(n));
for k=1:length(n)-N
    A=n(k:k+N);
    sort(A);
    if (rem(N,2)==0)
        y(k)=(A(N/2)+A(N/2+1))/2;
    else
        y(k)=A((N+1)/2);
    end
end
subplot(4,1,3);
plot(abs(fft(y)));
title("1n.mp4");

max=0;
index=0;
demo=abs(fft(y));
for k=1:length(demo)
    if (demo(k)>max)
        max=demo(k);
        index=k;
    end

end

if index>150
    disp("pad");
    writePWMVoltage(a,'D9',1); % Red
    writePWMVoltage(a,'D6',0);
else
    disp("bat");
    writePWMVoltage(a,'D9',0); % Green
    writePWMVoltage(a,'D6',1); 
end

%%%%%%%%%%%%%%%%%%% 2n.mp4 %%%%%%%%%%%%%%%%%%%

N = 300;
[n,Fs]=audioread('2n.mp4');
p=length(n);
y=zeros(1,length(n));
for k=1:length(n)-N
    A=n(k:k+N);
    sort(A);
    if (rem(N,2)==0)
        y(k)=(A(N/2)+A(N/2+1))/2;
    else
        y(k)=A((N+1)/2);
    end
end
subplot(4,1,4);
plot(abs(fft(y)));
title("2n.mp4");

max=0;
index=0;
demo=abs(fft(y));
for k=1:length(demo)
    if (demo(k)>max)
        max=demo(k);
        index=k;
    end

end

if index>150
    disp("pad");
    writePWMVoltage(a,'D9',1); % Red
    writePWMVoltage(a,'D6',0);
else
    disp("bat");
    writePWMVoltage(a,'D9',0); % Green
    writePWMVoltage(a,'D6',1); 
end