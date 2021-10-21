function [FF1,f1,col]=amp_correspondence_map(col_id, mat,syn_copy,numMem)%signle vector

[r,~]=size(mat);
rs=syn_copy;

[yupper,ylower] = envelope(mat,10,'peak');

for i=1:r
    
    if(yupper(i)<rs(i))
        rs(i)=yupper(i);
    end
    
    if(ylower(i)>rs(i))
        rs(i)=ylower(i);
    end
    
end

[~,loc]=findpeaks(yupper);
[~,loc2]=findpeaks(-ylower);

for i=1:length(loc)
    if(rs(loc(i))<yupper(loc(i)))
        rs(loc(i))=yupper(loc(i));
    end
end

for i=1:length(loc2)
    if(rs(loc2(i))>yupper(loc2(i)))
        rs(loc2(i))=yupper(loc2(i));
    end
end

col=rs;

% temp=syn_copy;
% temp(:,col_id)=col;
% A{1}=temp;
%col
%std(col)
%[FF1,f1]=mat_computeFitness2(mat,A,numMem);
FF1=0;
f1=0;

end