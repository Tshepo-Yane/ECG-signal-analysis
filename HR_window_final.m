%Tshepo Yane
% Design challenge
% Detect changes in heart rate differences between two 10s windows
clc
%separate into 10 second windows
window_size=10;%in seconds
window_time=window_size*200;%number of data points per second
%generating the time intervals
duration_end=[window_size:window_size:time(end)]*200;
duration_start=[0:window_size:time(end)-window_size]*200;
duration_start(1)=1;

%% Patient 1
HR_array_P1=[];
%loop through array to find  heart rates in all the 10 windows
for j=1:length(Data(1,1,:,1)) %loops over the number of trails
    signal=Data(:,3,j,1);
    
    %centre the signal about x=0
    moving_mean = movmean(signal,10000);
    signal=signal-moving_mean;
    
    %filter the signal
    signal=lowpass(signal,0.05);
    
    for i=1:(length(signal))/window_time
        duration=duration_start(i):duration_end(i);
        signal_window=signal(duration);
        
        %find number R peaks  within the 10s window
        peaks=islocalmax(signal_window,'MinProminence',0.5);
        sum_peaks=sum(peaks);
        HR=sum_peaks/(window_size/60);
        HR_array_P1(j,i)=HR;
    end
end
% calculate the mean and standard deviation of heart rate
HR_avg_Patient1=mean(HR_array_P1,2);
HR_std_Patient1=std(HR_array_P1,0,2);

%% Patient 2
HR_array_P2=[];
%loop through array to find  heart rates in all the 10 windows
for j=1:length(Data(1,1,:,1)) %loops over the number of trails
    signal=Data(:,3,j,2);
    %centre the signal about x=0
    moving_mean = movmean(signal,10000);
    signal=signal-moving_mean;
    
    %filter the signal
    signal=lowpass(signal,0.05);
    
    for i=1:(length(signal))/window_time
        duration=duration_start(i):duration_end(i);
        signal_window=signal(duration);
        
        %find number R peaks  within the 10s window
        peaks=islocalmax(signal_window,'MinProminence',0.5);
        sum_peaks=sum(peaks);
        HR=sum_peaks/(window_size/60);
        HR_array_P2(j,i)=HR;
    end
end

% calculate the mean and standard deviation of heart rate
HR_avg_Patient2=mean(HR_array_P2,2);
HR_std_Patient2=std(HR_array_P2,0,2);

%% Patient 3
HR_array_P3=[];
%loop through array to find  heart rates in all the 10 windows
for j=1:length(Data(1,1,:,1)) %loops over the number of trails
    signal=Data(:,3,j,3);
    %centre the signal about x=0
    moving_mean = movmean(signal,10000);
    signal=signal-moving_mean;
    
    %filter the signal
    signal=lowpass(signal,0.05);
    
    for i=1:(length(signal))/window_time
        duration=duration_start(i):duration_end(i);
        signal_window=signal(duration);
        %find number R peaks  within the 10s window
        peaks=islocalmax(signal_window,'MinProminence',0.15);
        
        sum_peaks=sum(peaks);
        HR=sum_peaks/(window_size/60);
        HR_array_P3(j,i)=HR/2;
    end
end
% calculate the mean and standard deviation of heart rate
HR_avg_Patient3=mean(HR_array_P3,2);
HR_std_Patient3=std(HR_array_P3,0,2);

%% Plotting the data
% A plot of the heart rates for the 3 patients during the 10 second windows  while they were exercising
time_interval_array=10:10:120; % creating eitime array
line_width=1.5;
plot(time_interval_array,HR_array_P1(4,:),"o-","LineWidth",line_width)%patient 1
hold on
plot(time_interval_array,HR_array_P2(4,:),"o-","LineWidth",line_width)%patient 2
plot(time_interval_array,HR_array_P3(4,:),"o-","LineWidth",line_width)%patient 3
xlabel("Time interval (s)",'interpreter','latex')
ylabel("Heart Rate (BPM)",'interpreter','latex')
legend("Patient 1","Patient 2","Patient 3",'interpreter','latex')
set(gca,'FontSize',14)
grid on
grid minor
hold off