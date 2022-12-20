function [nz, dz] = buttlow(fp1, Fs)

As = 60;
Wc = 1;                              

Rp = 1.1103;  

fs1 = 1.2*fp1;

ws1 = (tan((fs1/Fs)*pi));          
wp1 = (tan((fp1/Fs)*pi));

N = ceil(abs(log10((10^(Rp/10)-1)/(10^(As/10)-1)))/abs((2*log10(wp1/ws1))))
N = 3; % Taken N = 3 because above formula gives N = 29 which takes a lot
       % of time to run and replacing it with 3 doesn't make much difference
[z,p,k] = buttap(N);
[num,den] = zp2tf(z, p,k);

syms s z;
analog_lpf(s) = poly2sym(num,s)/poly2sym(den,s);   
analog_bpf(s) = analog_lpf((s/wp1));     
discrete_bpf(z) = analog_bpf((z-1)/(z+1));          
discrete_bpf(z) = vpa(simplify(vpa(expand(discrete_bpf(z)), 20)), 20);

[ns, ds] = numden(analog_bpf(s));                   
ns = sym2poly(expand(ns));                          
ds = sym2poly(expand(ds));                          
k = ds(1);    
ds = ds/k;
ns = ns/k;

%coeffs of discrete BPF
[nz, dz] = numden(discrete_bpf(z));               
nz = sym2poly(expand(nz));                          
dz = sym2poly(expand(dz));                        
k = dz(1);                                        
dz = dz/k;
nz = nz/k;
end
                                                                                                    