%This script will handle postprocessing of graphs and images. 
warning off all
uy=10;
gop=1:uy;
hop=gop;
o=gop;
h=ones(uy,2);
Sig=zeros(w,1);
variance=Sig;
sigma=Sig;
conf=h;
confidence=zeros(w,2);

for i=1:w
    for ii=1:y
        Sig(i)=Sig(i)+(statheal1(ii,i,1)-healerss(i,1))^2+(statheal2(ii,i,1)-healerss(i,1))^2;
    end
    variance(i)=Sig(i)/(2*y);
    sigma(i)=sqrt(variance(i));
    confidence(i,1)=healerss(i)-(1.980*(sigma(i)/(sqrt(2*y))));
    confidence(i,2)=healerss(i)+(1.980*(sigma(i)/(sqrt(2*y))));
end


for g=1:length(healerss)
    for k=1:p
        Op=(healerss(g,k));
        for l=1:uy
            if Op > gop(l)
                hop(gop==min(gop))=hop(l);
                h(gop==min(gop),1)=h(l,1);
                h(gop==min(gop),2)=h(l,2);
                conf(gop==min(gop),1)=conf(l,1);
                conf(gop==min(gop),2)=conf(l,2);
                gop(gop==min(gop))=gop(l);
                hop(l)=hph(g,k);
                gop(l)=Op;
                h(l,1)=g;
                h(l,2)=pp(k);
                conf(l,1)=confidence(g,1);
                conf(l,2)=confidence(g,2);
                break
            end
        end
    end
end

gop3=gop/29.99;

z=[h(:,1),h(:,2),gop(:),gop3(:),hop(:),conf(:,1),conf(:,2)];
z=sortrows(z,4);
disp ' '
disp 'Mods #   Rotation   Healing      HPS     HPH     Lower Conf   Upper Conf'
fprintf('%5.0f      %2.0f      %8.2f    %6.2f   %6.2f   %8.2f    %8.2f\n',z')
lgk=sprintf('%g\t%g\t%g\t%g\t%g\t%g\n',z');

%% Graphing
figure(GearTracker)

z2=sortrows(z,-4);
cc = hsv(uy); %Adds color to each line

for i=1:uy
    R1{i}=sprintf('%s%g','Mod Comb: ',z(i,1));
    R=barh(i,z(i,3));
    set(R,'FaceColor',cc(i,:),'EdgeColor',cc(i,:));  
    hold on
    legend(R1)
end
axis([(min(z(:,3))-100) (max(z(:,3))+100) 0 uy+1])
xlabel('Healing')
ylabel('Gear Combination #')
title('Top 5 Gear Combinations')
disp ' '
