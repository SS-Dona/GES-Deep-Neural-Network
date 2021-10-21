function [F,fitness]=mat_computeFitness2(ori_mat,initMat,numMem)
[r,c]=size(ori_mat);

% two fitness 
fitness=zeros(1,numMem);
F=zeros(numMem,3);

for i=1:numMem
    mem=initMat{i};
    f1=0;
    f2=0;
    f3=0;
    
    for j=1:c
        f1=0;%f1+dtw(ori_mat(:,j),mem(:,j),1);
        f3=f3+immse(ori_mat(:,j),mem(:,j)); %minimize
    end
    %f1
    f2=get_Multi_Corr_DisSimilarity(ori_mat,mem); %minimize
   
    %fitness(i)=norm([f1,f2],2);
    fitness(i)=f1+f2+f3;
    F(i,:)=[f1,f3,f2];
end