clear;
clc;

a = arduino();

%%%%%%%%%%%%% 2.mp4 %%%%%%%%%%

N = 20;
[n,Fs]=audioread('2.mp4');

p=length(n);
z=zeros(1,p);
for q=1:p
    z(1,q)=n(q,1);
    
end

A=zeros(1,N);
y=[A,z];

w=zeros(1,p+N);
w(1)=0;

for k=2:length(w)
    w(k)=w(k-1)+y(k);
end

t=zeros(1,p+N);

for k=1:length(w)
    if ((k-N)>0)
        t(k)=(w(k)-w(k-N))/N;
    end
    if ((k-N)<0)
        t(k)=w(k)/N;
    end
end
max=0;
demo=abs(fft(t));
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
xq=1:length(t);
subplot(4,1,1);
sound(t,Fs);
plot(xq,abs(fft(t)));
title("2.mp4");

%%%%%%%%%%%%%%%%%%%%%%% 2n.mp4 %%%%%%%%%%%%%%%%%%%%

max=0;
index=0;

N = 20;
n=audioread('2n.mp4');

p=length(n);
z=zeros(1,p);
for q=1:p
    z(1,q)=n(q,1);
    
end

A=zeros(1,N);
y=[A,z];

w=zeros(1,p+N);
w(1)=0;

for k=2:length(w)
    w(k)=w(k-1)+y(k);
end

t=zeros(1,p+N);

for k=1:length(w)
    if ((k-N)>0)
        t(k)=(w(k)-w(k-N))/N;
    end
    if ((k-N)<0)
        t(k)=w(k)/N;
    end
end
demo=abs(fft(t));
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
xq=1:length(t);
subplot(4,1,2);
plot(xq,abs(fft(t)));
title("2n.mp4");

%%%%%%%%%%%%%%%%%%%%% 1n.mp4 %%%%%%%%%%%%%%

N = 20;
n=audioread('1n.mp4');

z = n';
A=zeros(1,N);
y=[A,z];

w=zeros(1,p+N);
for k=2:length(w)
    w(k)=w(k-1)+y(k);
end

t=zeros(1,p+N);

for k=1:length(w)
    if ((k-N)>0)
        t(k)=(w(k)-w(k-N))/N;
    end
    if ((k-N)<0)
        t(k)=w(k)/N;
    end
end

demo=abs(fft(t));

index = 0;
max = 0;

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
xq=1:length(t);
subplot(4,1,3);
plot(xq,abs(fft(t)));
title("1n.mp4");

%%%%%%%%%%%%%%%%%%%%% 1.mp4 %%%%%%%%%%%%%%%%%%%%

index=0;
max=0;
N = 20;
n=audioread('1.mp4');

p=length(n);
z=zeros(1,p);
for q=1:p
    z(1,q)=n(q,1);
    
end

A=zeros(1,N);
y=[A,z];

w=zeros(1,p+N);
w(1)=0;

for k=2:length(w)
    w(k)=w(k-1)+y(k);
end

t=zeros(1,p+N);

for k=1:length(w)
    if ((k-N)>0)
        t(k)=(w(k)-w(k-N))/N;
    end
    if ((k-N)<0)
        t(k)=w(k)/N;
    end
end

demo=abs(fft(t));


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
xq=1:length(t);
subplot(4,1,4);
plot(xq,abs(fft(t)));
title("1.mp4");



