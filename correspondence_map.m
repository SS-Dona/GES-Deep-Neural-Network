function pat=correspondence_map(mat)%signle vector

[r,~]=size(mat);

offset=floor((50/100)*r);
min_window=5;

if(min_window>offset)
    'why!?!?!?'
end
wsize=min_window:offset:r;

mean_res=zeros(length(wsize),r);
count=1;
for i=wsize
    st=1:i:r;
    en=i:i:r;
    
    if(length(st)>length(en))
        en=[en,r];
    end
    
    for j=1:length(st)
        mean_res(count,st(j):en(j))=mean(mat(st(j):en(j)))*ones(1,en(j)-st(j)+1);
    end
    
    count=count+1;
end

pat=mean(mean_res);

end