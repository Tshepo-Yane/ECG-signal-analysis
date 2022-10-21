
%Tshepo Yane
%Design challenge
%filtered data
clc
%% Patient 1
Heart_rate_P1=[];
time=time_P1_T1;
window_time=3*200;
for i=1:length(Data(1,1,:,1)) %loops over the number of trails
    
    %Use lead B to find heart rate
    signal=Data(:,3,i,1);
    %centre the signal
    moving_mean = movmean(signal,10000);
    signal=signal-moving_mean;
    
    %filter the signal
    signal=lowpass(signal,0.05);
    
    peaks=islocalmax(signal,'MinProminence',0.5);
    
    %heart rate calculation
    sum_peaks_P3T1=sum(peaks);% number of heart beats recorded
    num_sec=Data(end,1,i,1)/60;  %  divide by number total number of minutes
    HR=sum_peaks_P3T1/num_sec;
    Heart_rate_P1(i)=HR;
end
%% Patient 2
Heart_rate_P2=[];
for i=1:length(Data(1,1,:,2)) %loops over the number of trails
    
    %Use lead B to find heart rate
    signal=Data(:,3,i,2);
    %centre the signal
    moving_mean = movmean(signal,10000);
    signal=signal-moving_mean;
    
    %filter the signal
    signal=lowpass(signal,0.05);
    
    peaks=islocalmax(signal,'MinProminence',0.5);
    
    %heart rate calculation
    sum_peaks_P3T1=sum(peaks);% number of heart beats recorded
    num_sec=Data(end,1,i,1)/60;  %  divide by number total number of minutes
    HR=sum_peaks_P3T1/num_sec;
    Heart_rate_P2(i)=HR;
end
 
%% Patient 3
Heart_rate_P3=[];
time=time_P3_T1;
for i=1:length(Data(1,1,:,2)) %loops over the number of trails
    
    %Use lead B to find heart rate
    signal=Data(:,3,i,3);
    %centre the signal
    moving_mean = movmean(signal,1000);
    signal=signal-moving_mean;
    
    peaks=islocalmax(signal,'MinProminence',0.22);
    
    %heart rate calculation
    sum_peaks_P3T1=sum(peaks);% number of heart beats recorded
    num_sec=Data(end,1,i,1)/60*2;  %  divide by number total number of minutes
    HR=sum_peaks_P3T1/num_sec;
    Heart_rate_P3(i)=HR;
end

%%
all_HR_rates=round([Heart_rate_P1;Heart_rate_P2;Heart_rate_P3]);


