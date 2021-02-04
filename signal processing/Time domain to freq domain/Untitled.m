fs=1000; %sampling frequency
ts=1/fs; %sampling period or timestep between two points

%Total time period is denoted as dt. Here, the time starts at t=0s, the
%time interval is ts, takes total of 2s time period basically
dt=0:ts:2-ts; 

f1=10;
f2=50;
f3=100;

y1=10*sin(2*pi*f1*dt);
y2=10*sin(2*pi*f2*dt);
y3=10*sin(2*pi*f3*dt);
y4=y1+y2+y3;

% subplot(4,1,1);
% plot(dt,y1,'r');
% 
% subplot(4,1,2);
% plot(dt,y2,'r');
% 
% subplot(4,1,3);
% plot(dt,y3,'r');
% 
% subplot(4,1,4);
% plot(dt,y4,'r');

%plot(dt,y4,'r');

len=length(y4); % length of time (total time of the data) 
len_converted=2^nextpow2(len); % length converted to the nearest power of 2
freq_domain= fft(y4,len_converted); % transforming into frequency domain 
freq_domain_1_cycle=freq_domain(1:len_converted/2); %taking only 1 cycle, as fft is symmetric 
% convert every data point on x axis, from time domain to freq domain
%the formula is:
% a point on x_axis in time domain * sampling frequency / length of samples
x_axis=(0:len_converted/2 -1)* fs/len_converted;

%plot(x_axis,abs(freq_domain_1_cycle))%this is not completely correct becuase we have not well defined the x axis valus



subplot(2,1,1);
plot(dt,y4);
xlabel('Time (s)');
ylabel('Amplitude (v)');
title('Time domain');

subplot(2,1,2);
plot(x_axis,abs(freq_domain_1_cycle));
xlabel('Freq (Hz) ');
ylabel('Amplitude (v) averaged');
title('Freq domain');



