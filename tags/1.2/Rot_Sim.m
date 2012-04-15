%Initial formatting
clc,clear
format short

%This section uses a function developed by Ke Feng that allows MATLAB
%to send you a text message to your cellphone when the simulator has
%completed its work. Since this fucntion was not developed by me I will
%not be uploading it here. Instead, the file for this function can be found at
%http://www.mathworks.com/matlabcentral/fileexchange/16649
%The file is not required to run the simulator and one just needs to
%remove the following line.
send_text_message('3306358426','tmobile','Start Time')

%Start Timer
tic

%Set up blank base save files
%save('HR-RakataGear-Trial2-2.mat')
save('HR-OverallBiS-Trial1-0.mat')

%Start GearTracker
GearTracker=2;


while (1)
    GearTracker
    if GearTracker == 1
        load('HR-RakataGear-Trial2-2.mat')
        x=1;
    elseif GearTracker == 2
        load('HR-OverallBiS-Trial1-0')
        x=3;
    end
    
    %Set number of rotations to test
    pp=10;
    p=length(pp);
    
    %Set skills and gear to test
    s=1;
    
    %Time limit and time step
    N=3000; dt=.01;
    
    Gear_model
    
    vv=mods;
    %vv=h(:,1);
    y=120;e=1;
    ww=length(vv);
    statheal1=zeros(y,ww,j);
    statheal2=zeros(y,ww,j);
    healerss=zeros(ww,p);
    healerss2=zeros(ww,p);
    heattotal=zeros(ww,p);
    hph=zeros(ww,p);
    
    for w=1:ww
        v1=w;
        w
        %Player calculations
        skills
        player_stats
        ability_model
        Rot_model
        
        %Preallocate arrays for speed
        t=zeros(N,1);
        
        %% Rotations to test
        for j=1:p
            jj=pp(j);
            
            for yy=1:y%Sample Size
                
                %Reset Group Data
                group_model
                
                %Run setup conditions
                for o=1:length(rot(j).setup)
                    eval(char(rot(j).setup(o)));
                end
                
                %Set Procs, stacks, healing, and heat
                %This section will be replaced with a Rot.Setup command.
                
                
                %Run setup conditions
                for o=1:length(rot(j).setup)
                    eval(char(rot(j).setup(o)));
                end
                
                glcd=0;
                healing=0;
                healing2=0;
                heat1=0;
                heattime=0.01;
                q=1; %Sequence counter
                uu=0;
                kk=0;
                
                %% Start Simulation
                for m=1:N
                    %Track time
                    t(m,yy)=(m-1)*dt;
                    
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
                                heal3=player.critperc*((val.healmin(n) + rand(1)*(val.healmax(n)-val.healmin(n)))*(1+SCGStackmod+SCGmod+KRmod));
                                healing=healing+heal1;
                                healing2=healing2+heal3;
                                CRT=6;
                            else heal1=(val.healmin(n) + rand(1)*(val.healmax(n)-val.healmin(n)))*(1+SCGStackmod+SCGmod+KRmod);
                                heal3=(val.healmin(n) + rand(1)*(val.healmax(n)-val.healmin(n)))*(1+SCGStackmod+SCGmod+KRmod);
                                healing=healing+heal1;
                                healing2=healing2+heal3;
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
                                dur.PMTimer(1)=3;
                                PMTick(1)=3;
                            else
                                for mm=2:GS
                                    if PMM >= (Tank+(mm-2)*GP) && PMM <= (Tank+(mm-1)*GP)
                                        group(j).PM(mm)=9;
                                        dur.PMTimer(mm)=3;
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
                            if rand <= player.critchance
                                healing=healing+player.critperc*(healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod));
                                healing2=healing2+player.critperc*(healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod));
                                CRT=6;
                            else healing=healing+healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod);
                                healing2=healing2+healmin.ProactiveMedicine*(1+SCGStackmod+SCGmod+KRmod);
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
                            heal3=player.critperc*((healmin.KoltoShell1 + rand(1)*(healmax.KoltoShell1-healmin.KoltoShell1))*(1+SCGStackmod+SCGmod+KRmod));
                            healing=healing+heal2;
                            healing2=healing2+heal3;
                            CRT=6;
                        else heal2=(healmin.KoltoShell1 + rand(1)*(healmax.KoltoShell1-healmin.KoltoShell1))*(1+SCGStackmod+SCGmod+KRmod);
                            heal3=(healmin.KoltoShell1 + rand(1)*(healmax.KoltoShell1-healmin.KoltoShell1))*(1+SCGStackmod+SCGmod+KRmod);
                            healing2=healing2+heal3;
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
                    
                    %Reduce durations5241600
                    dur.CRT=max(dur.CRT-dt,0);
                    dur.SCG=max(dur.SCG-dt,0);
                    dur.VH=max(dur.VH-dt,0);
                    dur.KS=max(dur.KS-dt,0);
                    dur.KR=max(dur.KR-dt,0);
                    dur.KSTimer=max(dur.KSTimer-dt,0);
                    dur.PMTimer(:)=max(dur.PMTimer(:)-dt,0);
                    
                    %Reduce PM Uptime
                    group(j).PM(:)=max(group(j).PM(:)-dt,0);
                    
                    %End simulation when time expires.
                    if t(m) >= N*dt, break,end
                end
                
                %Healing and heat tracker
                healerss(w,j)=healerss(w,j)+healing+healing2;
                statheal1(yy,w,j)=healing;
                statheal2(yy,w,j)=healing2;
                
            end
            healerss(w,j)=healerss(w,j)/(2*y);
            heattotal(w,j)=heattotal(w,j)/y;
            hph(w,j)=healerss(w,j)/heattotal(w,j);
        end
    end
    postprocessing   
    
    kgl=sprintf('%s%g','GearTracker ',GearTracker);
    
    %This section uses a function developed by Ke Feng that allows MATLAB
    %to send you a text message to your cellphone when the simulator has
    %completed its work. Since this fucntion was not developed by me I will
    %not be uploading it here. Instead, the file for this function can be found at
    %http://www.mathworks.com/matlabcentral/fileexchange/16649
    %The file is not required to run the simulator and one just needs to
    %remove the following two lines.
    send_text_message('330-635-8426','tmobile',kgl)
    send_text_message('330-635-8426','tmobile','Rank Mods Healing HPS HPH',lgk)
    
    if GearTracker == 1
        save('HR-RakataGear-Trial2-2.mat')
    elseif GearTracker == 2
        save('HR-OverallBiS-Trial1-0.mat')
    end
    toc
    if GearTracker >= 1,break,end
    GearTracker=GearTracker+1;
    
end
