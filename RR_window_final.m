%% Tshepo Yane
%Design challenge
%Respiratory rate in 30 second windows
clc;
time=Pat1(:,1);
%separate into 30 second windows
window_size=30;%in seconds
window_time=window_size*200;
duration_end=[window_size:window_size:time(end)]*200;
duration_start=[0:window_size:time(end)-window_size]*200;
duration_start(1)=1;

%% Patient 1
RR_rates_P1=[];
signal_array_P1=squeeze(Data(:,3,:,1));

for Patient_Trial=1:length(signal_array_P1(1,:)) %loops over the number of trails
    signal=signal_array_P1(:,Patient_Trial);
    
    for window_index=1:floor((length(signal))/window_time)
        
        %subtract local mean from signal
        M = movmean(signal,1000);
        signal=signal-M;
        
        %take 30 second window of signal
        duration=duration_start(window_index):duration_end(window_index);
        signal_window=signal(duration);
        %plot(time(duration),signal_window)
        
        %calculate fft
        Fs=1/time(2);% sample frequency
        L = length(signal);
        f = Fs*(0:(L/2))/L;
        
        Y=fft(signal);
        
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        
        cut_off_idx=61;% cut off point in frequency
        RR_Range=P1(1:cut_off_idx);
        
        RR_peaks=islocalmax(RR_Range,"MinProminence",0.007);  %find the local maximum only up to frequency 1hz
        
        
        RR_peak_idx=find(RR_peaks); %Indexes of the peaks
        
        RR_freqs=f(RR_peak_idx); % find the frequencies of the peaks
        
        RR_amps=P1(RR_peak_idx);%find the amplitude of the peaks
        
        RR_freq_cut_off_idx=find(RR_freqs<0.4 & RR_freqs>0.16 ); %only take indexes of peaks between the frequencies of 0.16Hz and 0.4Hz
        
        RR_freq_cut_off_val=RR_freqs(RR_freq_cut_off_idx);%actual values of frequencies obtained between 0.16hz and 0.4Hz
        
        RR_amp_cut_off_val=RR_amps(RR_freq_cut_off_idx);%actual values of amplitudes of corresponding to frequencies obtained
        
        RR_amp_max_idx=find(max(RR_amp_cut_off_val));  % find the largest amplitudes among the frequency spikes
        
        RR_freqency=RR_freq_cut_off_val(RR_amp_max_idx); % frequency value  of largest spike
        RR_rate=round(RR_freqency*60); %convert to breathing rate
        
        RR_rates_P1(Patient_Trial,window_index)=RR_rate;
    end
end
%% Patient 2
RR_rates_P2=[];
signal_array_P2=squeeze(Data(:,3,:,2));

for Patient_Trial=1:length(signal_array_P2(1,:)) %loops over the number of trails
    signal=signal_array_P2(:,Patient_Trial);
    
    for window_index=1:floor((length(signal))/window_time)
        
        %subtract local mean from signal
        M = movmean(signal,1000);
        signal=signal-M;
        
        %take 30 second window of signal
        duration=duration_start(window_index):duration_end(window_index);
        signal_window=signal(duration);
        %plot(time(duration),signal_window)
        
        %calculate fft
        Fs=1/time(2);% sample frequency
        L = length(signal);
        f = Fs*(0:(L/2))/L;
        
        Y=fft(signal);
        
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        
        cut_off_idx=61;% cut off point in frequency
        RR_Range=P1(1:cut_off_idx);
        
        RR_peaks=islocalmax(RR_Range,"MinProminence",0.009);  %find the local maximum only up to frequency 1hz
        
        
        RR_peak_idx=find(RR_peaks); %Indexes of the peaks
        
        RR_freqs=f(RR_peak_idx); % find the frequencies of the peaks
        
        RR_amps=P1(RR_peak_idx);%find the amplitude of the peaks
        
        RR_freq_cut_off_idx=find(RR_freqs<0.4 & RR_freqs>0.16 ); %only take indexes of peaks between the frequencies of 0.16Hz and 0.4Hz
        
        RR_freq_cut_off_val=RR_freqs(RR_freq_cut_off_idx);%actual values of frequencies obtained between 0.16hz and 0.4Hz
        
        RR_amp_cut_off_val=RR_amps(RR_freq_cut_off_idx);%actual values of amplitudes of corresponding to frequencies obtained
        
        RR_amp_max_idx=find(max(RR_amp_cut_off_val));  % find the largest amplitudes among the frequency spikes
        
        RR_freqency=RR_freq_cut_off_val(RR_amp_max_idx); % frequency value  of largest spike
        RR_rate=round(RR_freqency*60); %convert to breathing rate
        
        RR_rates_P2(Patient_Trial,window_index)=RR_rate;
    end
end
%% Patient 3
RR_rates_P3=[];
signal_array_P3=squeeze(Data(:,3,:,3));

for Patient_Trial=1:length(signal_array_P3(1,:))%loops over the number of trails
    signal=signal_array_P3(:,Patient_Trial);
    
    for window_index=1:floor((length(signal))/window_time)
        
        %subtract local mean from signal
        M = movmean(signal,1000);
        signal=signal-M;
        
        %take 30 second window of signal
        duration=duration_start(window_index):duration_end(window_index);
        signal_window=signal(duration);
        %plot(time(duration),signal_window)
        
        %calculate fft
        Fs=1/time(2);% sample frequency
        L = length(signal);
        f = Fs*(0:(L/2))/L;
        
        Y=fft(signal);
        
        P2 = abs(Y/L);
        P1 = P2(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        
        cut_off_idx=61;% cut off point in frequency
        RR_Range=P1(1:cut_off_idx);
        
        RR_peaks=islocalmax(RR_Range,"MinProminence",0.007);  %find the local maximum only up to frequency 1hz
        
        
        RR_peak_idx=find(RR_peaks); %Indexes of the peaks
        
        RR_freqs=f(RR_peak_idx); % find the frequencies of the peaks
        
        RR_amps=P1(RR_peak_idx);%find the amplitude of the peaks
        
        RR_freq_cut_off_idx=find(RR_freqs<0.4 & RR_freqs>0.16 ); %only take indexes of peaks between the frequencies of 0.16Hz and 0.4Hz
        
        RR_freq_cut_off_val=RR_freqs(RR_freq_cut_off_idx);%actual values of frequencies obtained between 0.16hz and 0.4Hz
        
        RR_amp_cut_off_val=RR_amps(RR_freq_cut_off_idx);%actual values of amplitudes of corresponding to frequencies obtained
        
        RR_amp_max_idx=find(max(RR_amp_cut_off_val));  % find the largest amplitudes among the frequency spikes
        
        RR_freqency=RR_freq_cut_off_val(RR_amp_max_idx); % frequency value  of largest spike
        RR_rate=round(RR_freqency*60); %convert to breathing rate
        
        RR_rates_P3(Patient_Trial,window_index)=RR_rate;
    end
end
%% Plotting the representative graph of Trial 1s
time_interval_array=30:30:120; % creating time array
line_width=1.5;
plot(time_interval_array,RR_rates_P1(1,:),"o-","LineWidth",line_width)%patient 1
hold on
plot(time_interval_array,RR_rates_P2(1,:),"o-","LineWidth",line_width)%patient 2
plot(time_interval_array,RR_rates_P3(1,:),"o-","LineWidth",line_width)%patient 3
xlabel("Time interval (s)",'interpreter','latex')
ylabel("Breathing rate ",'interpreter','latex')
legend("Patient 1","Patient 2","Patient 3",'interpreter','latex')
set(gca,'FontSize',14)
ylim([8 20])
grid on
grid minor
hold off

