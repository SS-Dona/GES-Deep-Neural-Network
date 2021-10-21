function [offsprings,FitFF1,ff]=mat_permute(ori_mat,initMat,fitness,numMem,GMModel,avg_change,count)

mat_copy=initMat{1};
[rr,cc]=size(mat_copy);

ff=fitness;

numRows=randi(floor(rr/2),1);
numCols=randi(floor(cc/2),1);

if(~(mod(count,3)==0))
    FitFF=zeros(numRows,3);
else
    FitFF=zeros(numCols,3);
end


if(~(mod(count,3)==0))
    
    row_index=randperm(rr,numRows);
    len=length(row_index);
    
    for i=1:len      

        [FF1,f1,row]= makeChangeRow(i, mat_copy, ori_mat,GMModel,cc,rr,numMem,row_index);

        if(f1<ff)
            mat_copy(row_index(i),:)=row;
            ff=f1;
            FitFF(i,:)=FF1;
        end

    end
    
    

else
    
%     if((mod(count,5)==0))
%         ind=randperm(cc,numCols);
%         for i=1:numCols
%             col_id=ind(i);
%             [FF1,f1,col]=amp_correspondence_map(col_id,ori_mat(:,col_id),mat_copy(:,col_id),numMem);
%             if(f1<ff)
%                 mat_copy(:,col_id)=col;
%                 ff=f1;
%                 FitFF(i,:)=FF1;
%             end
%         end
%     else
    
        ori_pat=mat_correspondence_map(ori_mat);
        copy_pat=mat_correspondence_map(mat_copy);
%         dist=sqrt(sum((copy_pat-ori_pat).^2));
%         [~,ind]=sort(dist);

        temp=mat_copy;
        
        for i=1:numCols
            col_id=i;
            
            for kk=1:1
                [~,~,col]= makeChangeCol(col_id,copy_pat(:,col_id), ori_pat(:,col_id),temp, ori_mat,cc,rr,GMModel,numMem);
                [~,~,col]=amp_correspondence_map(col_id,ori_mat(:,col_id),col ,numMem);
                temp(:,col_id)=col;
                %copy_pat=mat_correspondence_map(mat_copy);
            end
            
            %temp(:,col_id)=col;
            A{1}=temp;
            [FF1,f1]=mat_computeFitness2(ori_mat,A,numMem);

            if(f1<ff)
                mat_copy(:,col_id)=col;
                ff=f1;
                FitFF(i,:)=FF1;
            end
       end
        %end
%     end

    
    
end

FitFF1=mean(FitFF);
offsprings{1}=mat_copy;