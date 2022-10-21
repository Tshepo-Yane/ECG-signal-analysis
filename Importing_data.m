%Tshepo Yane
%Design challegne 

% Importing  design challenge data
clc
clear all

Pat1=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_1");
Pat2=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_2");
Pat3=xlsread("design_challenge_3_lead_3_patient.xlsx","patient_3");
%% Extracting datan and organizing into a 4d tensor
%Patient 1
%TRIAL 1 DATA
time_P1_T1=Pat1(:,1);
leadA_P1_T1=Pat1(:,2);
leadB_P1_T1=Pat1(:,3);
leadC_P1_T1=Pat1(:,4);

%TRIAL 2 DATA
time_P1_T2=Pat1(:,6);
leadA_P1_T2=Pat1(:,8);
leadB_P1_T2=Pat1(:,9);
leadC_P1_T2=Pat1(:,8);

%TRIAL 3 DATA
time_P1_T3=Pat1(:,11);
leadA_P1_T3=Pat1(:,12);
leadB_P1_T3=Pat1(:,13);
leadC_P1_T3=Pat1(:,14);

%DATA TENSOR
Trial_data_Pat1=[];
Trial_data_Pat1(:,:,1)=[time_P1_T1 leadA_P1_T1 leadB_P1_T1 leadC_P1_T1];
Trial_data_Pat1(:,:,2)=[time_P1_T2 leadA_P1_T2 leadB_P1_T2 leadC_P1_T2];
Trial_data_Pat1(:,:,3)=[time_P1_T3 leadA_P1_T3 leadB_P1_T3 leadC_P1_T3];

%Patient 2
%TRIAL 1 DATA
time_P2_T1=Pat2(:,1);
leadA_P2_T1=Pat2(:,2);
leadB_P2_T1=Pat2(:,3);
leadC_P2_T1=Pat2(:,4);

%TRIAL 2 DATA
time_P2_T2=Pat2(:,6);
leadA_P2_T2=Pat2(:,8);
leadB_P2_T2=Pat2(:,9);
leadC_P2_T2=Pat2(:,8);

%TRIAL 3 DATA
time_P2_T3=Pat2(:,11);
leadA_P2_T3=Pat2(:,12);
leadB_P2_T3=Pat2(:,13);
leadC_P2_T3=Pat2(:,14);

%DATA TENSOR
Trial_data_Pat2=[];
Trial_data_Pat2(:,:,1)=[time_P2_T1 leadA_P2_T1 leadB_P2_T1 leadC_P2_T1];
Trial_data_Pat2(:,:,2)=[time_P2_T2 leadA_P2_T2 leadB_P2_T2 leadC_P2_T2];
Trial_data_Pat2(:,:,3)=[time_P2_T3 leadA_P2_T3 leadB_P2_T3 leadC_P2_T3];

%Patient 3
%TRIAL 1 DATA
time_P3_T1=Pat3(:,1);
leadA_P3_T1=Pat3(:,2);
leadB_P3_T1=Pat3(:,3);
leadC_P3_T1=Pat3(:,4);

%TRIAL 2 DATA
time_P3_T2=Pat3(:,6);
leadA_P3_T2=Pat3(:,8);
leadB_P3_T2=Pat3(:,9);
leadC_P3_T2=Pat3(:,8);

%TRIAL 3 DATA
time_P3_T3=Pat3(:,11);
leadA_P3_T3=Pat3(:,12);
leadB_P3_T3=Pat3(:,13);
leadC_P3_T3=Pat3(:,14);

%DATA TENSOR
Trial_data_Pat3=[];
Trial_data_Pat3(:,:,1)=[time_P3_T1 leadA_P3_T1 leadB_P3_T1 leadC_P3_T1];
Trial_data_Pat3(:,:,2)=[time_P3_T2 leadA_P3_T2 leadB_P3_T2 leadC_P3_T2];
Trial_data_Pat3(:,:,3)=[time_P3_T3 leadA_P3_T3 leadB_P3_T3 leadC_P3_T3];

%All  data matrix
Data(:,:,:,1)=Trial_data_Pat1;
Data(:,:,:,2)=Trial_data_Pat2;
Data(:,:,:,3)=Trial_data_Pat3;




