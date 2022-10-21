%% Tshepo Yane
%Design challenge
%Finding the  breathing rate
clc
time=Pat1(:,1);
Fs=1/time(2);
%% Pateint 1
%only Trial 1 and 2
signal_array_P1=[leadA_P1_T1 leadA_P1_T2  leadA_P1_T3];
RR_rates_P1=[];

for i=1:length(signal_array_P1(1,:))-1
    signal=signal_array_P1(:,i);
    %subtract local mean from signal
    M = movmean(signal,1000);
    signal=signal-M;
    
    %calculate fft
    L = length(signal);
    f = Fs*(0:(L/2))/L;
    Y=fft(signal);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    RR_range=islocalmax(P1,"MinProminence",0.015);  %find the local maximums
    RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
    RR_rates_P1(i)=round(RR_freq(1)*60); % convert to the respiration rate
end

% 1st half Patient 1  Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P1(:,3);
signal=signal(1:time_mid);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
RR_range=islocalmax(P1,"MinProminence",0.015); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P1_T3_1st=round(RR_freq(1)*60);%convert to the respiration rate

% 2nd half Patient 1  Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P1(:,3);
signal=signal(time_mid:end);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
RR_range=islocalmax(P1,"MinProminence",0.015); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P1_T3_2nd=round(RR_freq(1)*60);%convert to the respiration rate

RR_rates_P1=[RR_rates_P1 RR_rates_P1_T3_1st RR_rates_P1_T3_2nd];

%% Pateint 2
%only Trial 1 and 2
signal_array_P2=[leadC_P2_T1 leadC_P2_T2  leadC_P2_T3];
RR_rates_P2=[];
for i=1:length(signal_array_P2(1,:))-1
    signal=signal_array_P2(:,i);
    %subtract local mean from signal
    M = movmean(signal,1000);
    signal=signal-M;
    
    %calculate fft
    L = length(signal);
    f = Fs*(0:(L/2))/L;
    Y=fft(signal);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    RR_range=islocalmax(P1,"MinProminence",0.012);  %find the local maximums
    RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
    RR_rates_P2(i)=round(RR_freq(1)*60); % convert to the respiration rate
end

% 1st half Patient 2 Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P2(:,3);
signal=signal(1:time_mid);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
Fs=1/time(2);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
RR_range=islocalmax(P1,"MinProminence",0.01); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P2_T3_1st=round(RR_freq(1)*60);%convert to the respiration rate

%2nd half Patient 2  Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P2(:,3);
signal=signal(time_mid:end);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
Fs=1/time(2);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
RR_range=islocalmax(P1,"MinProminence",0.01); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P2_T3_2nd=round(RR_freq(2)*60);%convert to the respiration rate

RR_rates_P2=[RR_rates_P2 RR_rates_P2_T3_1st RR_rates_P2_T3_2nd];
%% Pateint 3
%only Trial 1 and 2
signal_array_P3=[leadA_P3_T1 leadA_P3_T2  leadA_P3_T3];
RR_rates_P3=[];
for i=1:length(signal_array_P3(1,:))-1
    signal=signal_array_P3(:,i);
    %subtract local mean from signal
    M = movmean(signal,1000);
    signal=signal-M;
    
    %calculate fft
    Fs=1/time(2);
    L = length(signal);
    f = Fs*(0:(L/2))/L;
    Y=fft(signal);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    RR_range=islocalmax(P1,"MinProminence",0.01);  %find the local maximums
    RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
    RR_rates_P3(i)=round(RR_freq(1)*60); % convert to the respiration rate
end

%1st half Patient 3 Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P3(:,3);
signal=signal(1:time_mid);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
Fs=1/time(2);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

RR_range=islocalmax(P1,"MinProminence",0.005); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P3_T3_1st=round(RR_freq(1)*60);%convert to the respiration rate

%2nd half Patient 3  Trial 3 signal
time_mid=60*200;%in seconds
signal=signal_array_P3(:,3);
signal=signal(time_mid:end);
%subtract local mean from signal
signal=signal-(movmean(signal,1000));

%calculate fft
Y=fft(signal);
Fs=1/time(2);
L = length(signal);
f = Fs*(0:(L/2))/L;
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

RR_range=islocalmax(P1,"MinProminence",0.01); %find the local maximums
RR_freq=f(find(RR_range)); % find the frequency of the respiration rate in Hz
RR_rates_P3_T3_2nd=round(RR_freq(1)*60);%convert to the respiration rate

RR_rates_P3=[RR_rates_P3 RR_rates_P3_T3_1st RR_rates_P3_T3_2nd];

all_RR_rates=[RR_rates_P1;RR_rates_P2;RR_rates_P3]