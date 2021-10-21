function [initMat,GMModel] =mat_initPop(numMem, ori_mat,mat)
initMat={};
[r,c]=size(ori_mat);

if(r<c)
    ori_mat=mat;
end
%fit guassian to original matrix

%%%%%use PCA to selct k
%%%%%%%%%%%%%%%point of improvement%%%%%%%%%%%%%
[~,~,latent,~,~,~] = pca(ori_mat);
k_comp=sum(latent>(10^-3));

if(k_comp>10)
    k_comp=3;
end

GMModel = fitgmdist(ori_mat,k_comp,'RegularizationValue',0.01);
%pdf_ori=pdf(GMModel,ori_mat);


for j=1:numMem
    Y=zeros(r,c);
    for i=1:r
        Y(i,:) = random(GMModel);
    end
    initMat{j}=Y;
end


end