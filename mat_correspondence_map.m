function pat=mat_correspondence_map(mat)%signle vector

[r,c]=size(mat);
pat=zeros(r,c);

for i=1:c
    pat(:,i)=correspondence_map(mat(:,i));
end

end