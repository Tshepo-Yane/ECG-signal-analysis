%Tshepo Yane
%Design challenge
%segment calculations
% 1st 2 seconds of Patient 2 only
last=2*200;% in seconds
signal=leadB_P2_T1(1:last);
time=time_P1_T1(1:last);

%centre the signal
moving_mean = movmean(signal,10000);
signal=signal-moving_mean;

%filter the signal
signal=lowpass(signal,0.05);
line_threshold=0.0;

%find the points of intersection
signal_abs=abs(signal-line_threshold);% find the difference between the signal and the threshold and take the absolute value
intersections=islocalmin(signal_abs,"MinProminence",0.03);% find the local minimums of the inverted graph to locate points of intersection


%find the distance between the points
intersections_idx=find(intersections);% obtain the indices

PR_start=intersections_idx(1:6:end);%get the end of the p wave index
PR_end=intersections_idx(2:6:end);% get the beginning of the R peak index
% find the max dimensions between the arrays in order to allow subtraction
max_dim=min(length(PR_start),length(PR_end));
PR_start=PR_start(1:max_dim);
PR_end=PR_end(1:max_dim);

ST_start=intersections_idx(3:6:end);%get the end of the R peak index
ST_end=intersections_idx(4:6:end);% get the beginning of the T wave index
% find the max dimensions between the arrays in order to allow subtraction
max_dim=min(length(ST_start),length(ST_end));
ST_start=ST_start(1:max_dim);
ST_end=ST_end(1:max_dim);
%find the distance of the segments in indices
PR_segment_idx=PR_end-PR_start;
ST_segment_idx=ST_end-ST_start;
%find the distance of the segments in time
PR_segment_time=PR_segment_idx*time(2);
ST_segment_time=ST_segment_idx*time(2);

PR_segment_avg=mean(PR_segment_time) %average PR segment time
PR_segment_std=std(PR_segment_time); %standard deviation of PR segment time

ST_segment_avg=mean(ST_segment_time) %average ST segment time
ST_segment_std=std(ST_segment_time); %standard deviation of ST segment time

figure
plot(time(ST_start),signal(ST_start),"r<","LineWidth",2)
hold on
plot(time(ST_end),signal(ST_end),"r>","LineWidth",2)
plot(time(PR_start),signal(PR_start),"m*","LineWidth",2)
plot(time(PR_end),signal(PR_end),"m+","LineWidth",2)
yline(line_threshold,"k","LineWidth",1.5)
plot(time,signal)
legend("Start of ST segment","End of ST segment","Start of PR segment","End of PR segment","Baseline ",'interpreter','latex')
xlabel("Time (s)",'interpreter','latex')
ylabel("Voltage (mV)",'interpreter','latex')
set(gca,'FontSize',14)
hold off
grid on
grid minor
