%We will use this function to determine the healing priority of each group
%member.
for v=1:p
    GS=16; %Group Size
    Tank=.6; %Tank Priority
    GP=(1-Tank)/(GS-1); %Set priority fo rest of the group
    group(v).PM=zeros(GS,1);
    group(v).Percent=zeros(GS,1);
    group(v).Percent(1)=Tank;
    
    for nn=2:GS
        group(v).Percent(nn)=Tank+(nn-1)*GP;
    end
end