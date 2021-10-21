function [FF1,f1,row]= makeChangeRow(i, mat_copy, ori_mat,GMModel,cc,rr,numMem,row_index)

        row=zeros(1,cc);

        th=rand(1);
        if(th< 0.01)
            for j=1:cc
                rand_index=randi(rr,1);
                row(j)=mat_copy(rand_index,j);        
            end
        elseif(th>=(0.01) && th<(0.05))
            row=random(GMModel);
        elseif(th>=(0.05) && th<(0.93))
            for j=1:cc
                %rand_index=randi(cc,1);
                res=rescale(rand(1,5),0,std(ori_mat(:,j)));
                row(j)=mean(ori_mat(:,j))+res(1);        
            end
        elseif(th>=(0.93) && th<(0.95))
            for j=1:cc
                %rand_index=randi(cc,1);
                res=rescale(rand(1,5),min(ori_mat(:,j)),max(ori_mat(:,j)));
                row(j)=res(1);        
            end
        else
            rid=row_index(i);
            row=mat_copy(rid,:);

            for j=1:cc
                cth=rand(i);
                if(cth>.5)
                    row_sam=random(GMModel);
                    row(j)=row_sam(j);
                end
            end
        end
        
        temp=mat_copy;
        temp(row_index(i),:)=row;
        A{1}=temp;

        [FF1,f1]=mat_computeFitness2(ori_mat,A,numMem);

end