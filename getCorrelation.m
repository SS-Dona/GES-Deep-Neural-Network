function COR= getCorrelation(rmat)

[~,colc]=size(rmat);
D1=zeros(colc,colc);
    
    for i=1:colc
        %if(i+1<=c)
         %   ind=i+1;
         ind=1;
            for j=ind:colc
                a=horzcat(rmat(:,i),rmat(:,j));
                D1(i,j)=pdist(a','correlation');
            end
        %end
    end
    

    rmat=D1;
    s=size(rmat);
   cor=zeros(s(1),s(2));
   
   for j=1:s(1)
       for k=1:s(2)
           if(rmat(j,k)>=1.5)
                cor(j,k)=-1;
           elseif(rmat(j,k)<=0.5)
               cor(j,k)=1;
           else
               cor(j,k)=0;
           end
       end
   end
   
   COR=cor;
  
end