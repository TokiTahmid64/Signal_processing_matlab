fs=200e3;
ts=1/fs;
dt=0:ts:5e-3 -ts;
 


f1=1e3;
f2=20e3;
f3=30e3;

y1=5*sin(2*pi*f1*dt);
y2=5*sin(2*pi*f2*dt);
y3=10*sin(2*pi*f3*dt);

y=y1+y2+y3;

%plot(dt,y);


len=length(y); % length of time (total time of the data) 
len_converted=2^nextpow2(len); % length converted to the nearest power of 2
freq_domain= fft(y,len_converted); % transforming into frequency domain 
freq_domain_1_cycle=freq_domain(1:len_converted/2); %taking only 1 cycle, as fft is symmetric 
x_axis=(0:len_converted/2 -1)* fs/len_converted;
plot(x_axis,abs(freq_domain_1_cycle))