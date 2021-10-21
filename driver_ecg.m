st_date = datetime(now,'ConvertFrom','datenum');
tStart=tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('ecg_nsr.mat') % insert tthe name of matrix; suppsose it is called ecg_rb.mat
ecg=ecg_nsr(:,1:50); % change ecg_nsr to ecg_rb
%ecg=ecg_afib(:,1:50); % change ecg_nsr to ecg_rb
%ecg=ecg_pvc(:,1:50); % change ecg_nsr to ecg_rb
%ecg=ecg_lbb(:,1:50); % change ecg_nsr to ecg_rb

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[r3,c3] =size(ecg);

wsize3=10;
st3=1:wsize3:c3;
en3=wsize3:wsize3:c3;
if(length(st3)>length(en3))
    en3=[en3,c3];
end

for i3=1:length(st3)
    i3
    mat=ecg(:,st3(i3):en3(i3));
    permite_one_driver;
    
    string=strcat('nsr_workshop_',num2str(i3),'.mat');
    save(string)
    %clear all
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%go into this method e.g. open accumulate_result.m
accumulate_result;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tEnd = toc(tStart)
synDuration = duration(0, 0, tEnd)
en_date = datetime(now,'ConvertFrom','datenum');

