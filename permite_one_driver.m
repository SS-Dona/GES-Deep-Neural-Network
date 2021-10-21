% load('SportsData.mat')
% 
% mat=SportsData.act1{2}{1};
% tic
% load('ecg_nsr.mat')
% 
% mat=ecg_nsr(:,1:15);

[r,c]=size(mat);
%r=1800;

wsize=50;
st=1:wsize:r;
en=wsize:wsize:r;

if(length(st)>length(en))
    en=[en,r];
end


% if((st(end)-en(end))<c)
%     st(end)=[];
%     en(end)=[];
% end

result={};
F={};
Fmat={};

len=length(st);

for i=1:len
    i
    ori_mat=mat(st(i):en(i),:);
    [FitArray,FitMat, offsprings]=permute_one(ori_mat,mat);
    
    F{i}=FitArray;
    result{i}=offsprings;
    Fmat{i}=FitMat;
end

%rs=gather(results);
%fit=gather(F);

output=zeros(r,c);
for i=1:length(result)
    output(st(i):en(i),:)=result{i}{1};
end
%toc