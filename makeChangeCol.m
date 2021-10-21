function [FF1,f1,col]= makeChangeCol(col_id, cp_vec,op_vec, mat_copy, ori_mat,cc,rr,GMModel,numMem)

col=zeros(rr,1);

cp = mat_copy(:,col_id);
or = ori_mat(:,col_id);

diff_vec=(cp_vec-op_vec);

% th=rand(1);

% if(th<1)
    
%     for j=1:rr
%         col(j) =cp(j)-diff_vec(j); 
%     end
%         
% elseif(th>=1/4 && th< 2/4)
    
    for j=1:rr
        col(j)=cp(j)-diff_vec(j);%+rand(1);
    end
       
% elseif(th>=2/4 && th< 3/4)
%     
%      for j=1:rr
%         row=random(GMModel);
%         col(j) =cp(j)+(row(col_id)-cp(j)); 
%     end
        
% else
%     
%     for j=1:rr
%         res=rescale(cp_vec(j),min(or),max(or));
%         col(j)=res;
%     end
% end



% temp=mat_copy;
% temp(:,col_id)=col;
% A{1}=temp;
% %col
%std(col)
FF1=0;
    f1=0;%mat_computeFitness2(ori_mat,A,numMem);
end