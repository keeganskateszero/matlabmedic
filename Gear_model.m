%This file generates the gear combinations that are tested by the
%simulator.

mods=[2,0,7,0,7,0,12,0];
n=1;
ll=0;
r=2;
rr=0;


%color crystals
while (1)%mods
    t=7;
    tt=0;
    while (1) %enhancements
        i=7;
        ii=0;
        while (1) %augments
            if x==1 %Must use Rakata for Set Bonus
                j=7;
            elseif x==2 %Black Hole BiS
                j=6;
            elseif x==3 %Overall BiS
                j=11; 
            end
            jj=0;
            while (1)
                mods(n,1)=r;
                mods(n,2)=rr;
                mods(n,3)=t;
                mods(n,4)=tt;
                mods(n,5)=i;
                mods(n,6)=ii;
                mods(n,7)=j;
                mods(n,8)=jj;
                n=n+1;
                if j == 0, break, end
                j=j-1;
                jj=jj+1;
            end
            if i == 0, break, end
            i=i-1;
            ii=ii+1;
        end
        if t == 0, break, end
       t=t-1;
        tt=tt+1;
    end
    if r == 0, break, end
    r=r-1;
   rr=rr+1;
end


