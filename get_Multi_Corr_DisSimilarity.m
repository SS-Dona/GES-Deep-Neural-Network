% with diagonal elements, upper traingualr matrix have n(n+1)/2 elements
%  without diagonal elements, upper traingualr matrix have n(n-1)/2 elements

function dis_metric= get_Multi_Corr_DisSimilarity(Original, Synthesized)

ori_COR= getCorrelation(Original);
syn_COR= getCorrelation(Synthesized);

dis_ind=find(ori_COR~=syn_COR);

[n,~]=size(ori_COR);
dis_metric=length(dis_ind)/(n^2);

end