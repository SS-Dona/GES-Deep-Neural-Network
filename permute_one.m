function [FitArray,FitMat,offsprings]=permute_one(ori_mat,mat)

numMem=1;
[initMat,GMModel] =mat_initPop(numMem,ori_mat,mat);

[~,ff]=mat_computeFitness2(ori_mat,initMat,numMem);

stopnow=1;

FitArray=[];
FitArray(end+1)=ff;

offsprings=initMat;
count=1;
iter=5000;

FitMat=zeros(iter,3);
avg_change=ff;

% y=sqrt(sum((ori_mat-offsprings{1}).^2));
% y2=pdist(ori_mat');

while (stopnow && ff>10 )%(stopnow && avg_change>10^(-4)) ||(stopnow && ff<100) )
    
    [offsprings,FitFF,ff]=mat_permute(ori_mat,offsprings,ff,numMem,GMModel,avg_change,count);
    FitArray(end+1)=ff;
    %ff
    FitMat(count,:)=FitFF;
    
    if(count>iter)
        stopnow=0;
    end
    
    count=count+1;
    
%     unchanged=20;
%     if(length(FitArray)>unchanged)
%         avg_change=mean(abs(diff(FitArray(end-unchanged:end))))
%     end
    
    
end

end