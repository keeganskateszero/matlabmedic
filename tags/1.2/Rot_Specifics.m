%Initial formatting and global variables.
clear,clc
format bank

%Set Rotations and Gear to test
p=10;
v1=4; %Place holder numbers atm

%Set skills and gear to test
e=0;
s=1;
x=1; %1=Rakata, 2=Black Hole, 3=Overall


%Time limit and time step
N=3000; dt=.01; y=1;

Gear_model

for w=1:length(v1)
    for j=1:length(p)
        %Set up timestamp for abilities
        timestamp(w,j).PM=zeros(16,5);
        
        %Set up healing  and heat tracker
        metric(w,j).heal=zeros(N,y);
        metric(w,j).heat=zeros(N,y);
        metric(w,j).hps=zeros(N,y);
        hps=zeros(w,j);
        heattotal=zeros(w,j);
        time(w,j).sequence=zeros(N,y);
        
        %Set up ability trackers
        ability(w,j).used=zeros(10,y);
        ability(w,j).heal=zeros(10,y);
        ability(w,j).sequence=zeros(10,y);
        ability(w,j).crits=zeros(10,y);
    end
end
ll=zeros(16,1);

for w=1:length(v1)
    ww=v1(w);
        
    %Player calculations
    skills
    player_stats
    ability_model
    Rot_model
    
    %Preallocate arrays for speed
    t=zeros(N,1);
    kk=0;
    
    %% Rotations to test
    for j=1:length(p)
        jj=p(j);
        
        for yy=1:y%Sample Size
            
            %Reset Group Data
            group_model
            
            %Run setup conditions
            for o=1:length(rot(j).setup)
                eval(char(rot(j).setup(o)));
            end
            
            %Set Procs, stacks, healing, and heat
            %This section will be replaced with a Rot.Setup command.
            
            glcd=0;
            healing=0;
            heat1=0;
            heattime=0.01;
            q=1; %Sequence counter
            uu=0;
            
            %% Start Simulation
            for m=1:N
                %Track time
                t(m)=(m-1)*dt;
                
                %Run ability model to account for Critical Reaction and
                %increased healing from SCGStacks and SCG.
                %Account for SCG Stacks
                if SCGStacks > 0 && SCGStacks <= 15
                    SCGStackmod=.01;
                elseif SCGStacks > 15 && SCGStacks < 30
                    SCGStackmod=.02;
                elseif SCGStacks == 30
                    SCGStackmod=.03;
                elseif SCGStacks == 0
                    SCGStackmod=0;
                end
                
                %Account for SCG Buff
                if dur.SCG > 0
                    SCGmod=.05;
                else SCGmod=0;
                end
                
                %Account for Kolto Residue Buff
                if dur.KR > 0
                    KRmod=.03;
                else KRmod=0;
                end
                
                if glcd <= 0
                    for k=1:length(rot(jj).cond)
                        if eval(char(rot(jj).cond(k)))
                            
                            %Set ability to be used
                            n=rot(jj).use(k);
                            
                            %Account for Critical Reaction
                            if dur.CRT > 0
                                CR=.05;
                            else
                                CR=0;
                            end
                            
                            CastTime=round(10^2*val.cast(n)*(player.castreduc-CR))/10^2;
                            CastCounter=1;
                            
                            %Determine sequence information
                            ability(w,j).sequence(q,yy)=n;
                            time(w,j).sequence(q,yy)=t(m);
                            ability(w,j).used(n,yy)=ability(w,j).used(n,yy)+1;
                            
                            %Set up sequence for next cast.
                            q=q+1;
                            
                            %Set glcds
                            eval(char(rot(jj).action1(n)));
                            
                            break %Break out of for loop
                        end
                    end
                end
                
                % Reduce Cast Time - Ensures that casted abilities apply
                % healing and heat before glcd is up. Will fix/move later.
                CastTime=max(CastTime-dt,0);
                
                %% Increase Heat & Healing
                
                %Healing & Crits
                if CastTime == 0 && CastCounter == 1
                    CastCounter=0;
                    for f=1:val.amount(n) %Some abilities heal multiple targets
                        if rand(1) <= player.critchance
                            heal1=player.critperc*((val.healmin(n) + rand(1)*(val.healmax(n)-val.healmin(n)))*(1+SCGStackmod+SCGmod+KRmod));
                            healing=healing+heal1;
                            ability(w,j).heal(n,yy)=ability(w,j).heal(n,yy)+heal1;
                            %ability(j).timestamp(n,yy)=
                            CRT=6;
                            ability(w,j).crits(n,yy)=ability(w,j).crits(n,yy)+1;
                        else heal1=(val.healmin(n) + rand(1)*(val.healmax(n)-val.healmin(n)))*(1+SCGStackmod+SCGmod+KRmod);
                            healing=healing+heal1;
                            ability(w,j).heal(n,yy)=ability(w,j).heal(n,yy)+heal1;
                        end
                    end
                    
                    %Heat
                    if heat1 == 0
                        heattime=t(m);
                        a=1;
                    end
                    heat1=heat1+val.heatcost(n);
                    heattotal(w,j)=heattotal(w,j)+val.heatcost(n);
                    
                    
                    %Evaluate the cast's actions: set cds, stacks, etc.
                    eval(char(rot(j).action2(n)))
                    
                    %Apply PM if HS is casted
                    if PM == 1
                        PM=0;
                        PMM=rand;
                        uu=uu+1;                        
                        if PMM <= Tank
                            group(j).PM(1)=9;
                            timestamp(w,j).PM(1,uu)=t(m);
                            dur.PMTimer(1)=3;
                            PMTick(1)=3;
                        else
                            for mm=2:GS
                                if PMM >= (Tank+(mm-2)*GP) && PMM <= (Tank+(mm-1)*GP)
                                    dur.PMTimer(mm)=3;
                                    group(j).PM(mm)=9;
                                    timestamp(w,j).PM(mm,uu)=t(m);
                                    PMTick(mm)=3;
                                    break
                                end
                            end
                        end
                    end
                end
                
                %Reduce Heat
                if t(m) == heattime+a %Heat Dissipates every second, not continuously.
                    a=a+1;
                    if heat1 <= 39
                        heat1=max(heat1-5,0);
                    elseif heat1 > 39 && heat1 <= 80
                        heat1=heat1-3;
                    elseif heat1 > 80
                        heat1=heat1-2;
                    end
                end
                
                %Account for Vent Heat ticks
                if dur.VH == 1.5
                    heat1=max(heat1-8,0);
                elseif dur.VH == 0 && VH == 1
                    heat1=max(heat1-8,0);
                    VH=0;
                end
                
                %Calculate healing from PM
                for u=1:GS
                    if  dur.PMTimer(u) <= 0 && PMTick(u) > 0
                        dur.PMTimer(u)=3;  
                        PMTick(u)=PMTick(u)-1;
                        ll(u)=ll(u)+1;
                        if rand <= player.critchance
                            healing=healing+player.critperc*(healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod));
                            ability(w,j).heal(8,yy)=ability(w,j).heal(8,yy)+player.critperc*healmin.ProactiveMedicine;
                            CRT=6;
                            ability(w,j).crits(8,yy)=ability(w,j).crits(8,yy)+1;
                        else healing=healing+healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod);
                            ability(w,j).heal(8,yy)=ability(w,j).heal(8,yy)+healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod);
                        end
                    end
                end
                
                %Calculate healing from KS
                if dur.KSTimer <= 0 && KSStacks > 0
                    KSStacks=KSStacks-1;
                    dur.KSTimer=3;
                    kk=kk+1;
                    if rand(1) <= player.critchance
                        heal2=player.critperc*((healmin.KoltoShell1 + rand(1)*(healmax.KoltoShell1-healmin.KoltoShell1))*(1+SCGStackmod+SCGmod+KRmod));
                        healing=healing+heal2;
                        ability(w,j).heal(7,yy)=ability(w,j).heal(7,yy)+heal2;
                        CRT=6;
                        ability(w,j).crits(7,yy)=ability(w,j).crits(7,yy)+1;
                    else heal2=(healmin.KoltoShell1 + rand(1)*(healmax.KoltoShell1-healmin.KoltoShell1))*(1+SCGStackmod+SCGmod+KRmod);
                        healing=healing+heal2;
                        ability(w,j).heal(7,yy)=ability(w,j).heal(7,yy)+heal2;
                    end
                    
                end
                
                
                %Reduce cooldowns
                ccd.HS=ccd.HS-dt;
                ccd.ES=ccd.ES-dt;
                ccd.KM=ccd.KM-dt;
                ccd.TSO=ccd.TSO-dt;
                ccd.PS=ccd.PS-dt;
                ccd.VH=ccd.VH-dt;
                glcd=glcd-dt;
                
                %Reduce durations
                dur.CRT=max(dur.CRT-dt,0);
                dur.SCG=max(dur.SCG-dt,0);
                dur.VH=max(dur.VH-dt,0);
                dur.KS=max(dur.KS-dt,0);
                dur.KR=max(dur.KR-dt,0);
                dur.KSTimer=max(dur.KSTimer-dt,0);
                dur.PMTimer(:)=max(dur.PMTimer(:)-dt,0);
                
                %Reduce PM Uptime
                group(j).PM(:)=max(group(j).PM(:)-dt,0);
                
                %Healing  and heat tracker
                metric(w,j).heal(m,yy)=healing;
                metric(w,j).hps(m,yy)=healing/t(m);
                metric(w,j).heat(m,yy)=heat1;
                
                %End simulation when time expires.
                if t(m) >= N*dt, break,end
            end
        end
        heattotal(w,j)=heattotal(w,j)/y;
        hph(w,j)=(sum(metric(w,j).heal(end,:))/y)/heattotal(w,j);
    end
end

