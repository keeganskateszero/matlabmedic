
i=1;
%Set up cooldowns for beginning of simulations
rot(1).setup={'dur.CRT=0;dur.SCG=13;dur.VH=0;dur.KS=30;dur.KR=0;dur.KSTimer=0;dur.PMTimer=zeros(GS,1);';...
	      'ccd.HS=0;ccd.KM=0;ccd.ES=0;ccd.TSO=0;ccd.PS=0;ccd.VH=0;';...
	      'PM=0;VH=0;TSO=0;PS=0;CE=0;CRT=0;';...
 	      'SCGStacks=0;KSStacks=10;PMTick=zeros(GS,1);'};

%Set up glcds 
rot(1).action1={'glcd=val.cast(n);';... % RS 1
    'glcd=val.cast(n);';... % RS9 2
    'glcd=val.cast(n);';... % HS 3
    'glcd=1.5;';... % ES 4
    'glcd=1.5;';... %RpS 5
    'glcd=1.5;';...%KM 6
    'glcd=1.5;';...%KS 7 
    'glcd=0;';...%SCG 8
    'glcd=0;';...%VH 9
    'glcd=0;';...%TSO 10w
    'glcd=0;'};%PS 11

%Set up after cast actions
rot(1).action2={'if dur.SCG<=0;SCGStacks=min(SCGStacks+3*skill(s).EmpoweredScans,30);end';... %RS 1
    'CE=0;if dur.SCG<=0;SCGStacks=min(SCGStacks+3*skill(s).EmpoweredScans,30);end;';...%RS9 2
    'if dur.SCG>0;ccd.HS=0; else ccd.HS=9-1.5*player.setbonus(2); end;CE=1; PM=1;...';...%HS 3
    'ccd.ES=18;';...%ES 4
    'if dur.SCG<=0;SCGStacks=SCGStacks+3;end;';...%RpS 5
    'ccd.KM=6;dur.KR=15;';...%KM 6
    'KSStacks=10; dur.KS=30;';...%KS 7 
    'dur.SCG=10+3*player.setbonus(1); SCGStacks=0;ccd.HS=0;heat1=max(heat1-8,0);';...%SCG 8
    'ccd.VH=120;heat1=max(heat1-(50+8*skill(s).ImprovedVents),0);VH=1;';...%VH 9
    'ccd.TSO=120;';...%TSO 10
    'ccd.PS=120;'};%PS 11

%% Healing Intensive Rotations

% 1
rot(1).name='ES>KS>KM>HS>RS9>RS>RpS';
rot(1).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'KSStacks == 0 && heat1 <= 84;'
    'ccd.KM<=0 & heat1<=84'
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';       
    'heat1<=75';
    'heat1>75'};
rot(1).use=[9;8;4;7;6;3;2;1;5];

i=i+1; % 2
rot(i)=rot(1);
rot(i).name='ES>KM>KS>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'
    'KSStacks == 0 && heat1 <= 84';
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';       
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;7;3;2;1;5];

i=i+1; % 3
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>KS>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'KSStacks == 0 && heat1 <= 84';
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;7;1;5];

i=i+1; % 4
rot(i)=rot(1);
rot(i).name='ES>HS>RS9>KM>KS>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';        
    'ccd.HS<=0 & heat1<=84 & CE==0';    
    'CE==1 & heat1<=83';  
    'ccd.KM<=0 & heat1<=84'
    'KSStacks == 0 && heat1 <= 84';
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;3;2;6;7;1;5];

i=i+1; % 5
rot(i)=rot(1);
rot(i).name='ES>HS>RS9>KS>KM>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'KSStacks == 0 && heat1 <= 84';
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;3;2;7;6;1;5];

i=i+1; % 6
rot(i)=rot(1);
rot(i).name='ES>KS>HS>RS9>KM>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=80 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';  
    'KSStacks == 0 && heat1 <= 84';
    'ccd.HS<=0 && heat1<=84 && CE==0';
    'CE==1 && heat1<=83';       
    'ccd.KM<=0 & heat1<=84'  
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;7;3;2;6;1;5];

i=i+1; % 7
rot(i)=rot(1);
rot(i).name='ES>HS>RS9>KM>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=80 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';  
    'ccd.HS<=0 && heat1<=84 && CE==0';
    'CE==1 & heat1<=83';       
    'ccd.KM<=0 && heat1<=84'  
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;3;2;6;1;5];

i=i+1; % 8
rot(i)=rot(1);
rot(i).name='ES>HS>RS9>KS>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=80 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';  
    'ccd.HS<=0 && heat1<=84 && CE==0';
    'CE==1 & heat1<=83';       
    'ccd.KM<=0 && heat1<=84'  
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;3;2;7;1;5];

i=i+1; % 9
rot(i)=rot(1);
rot(i).name='ES>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=80 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';  
    'ccd.HS<=0 && heat1<=84 && CE==0';
    'CE==1 & heat1<=83';    
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;3;2;1;5];

i=i+1; % 10
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;1;5];

%%Regen Intensive Rotations

i=i+1; % 11
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;1;5];

i=i+1; % 12
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;1;5];

i=i+1; % 13
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;1;5];

i=i+1; % 14
rot(i)=rot(1);
rot(i).name='ES>KM>HS>RS9>RS>RpS';
rot(i).note='';
rot(i).cond={'heat1>=90 && ccd.VH<=0';
    'SCGStacks >= 30';
    'ccd.ES<=0';
    'ccd.KM<=0 & heat1<=84'    
    'ccd.HS<=0 & heat1<=84 & CE==0';
    'CE==1 & heat1<=83';   
    'heat1<=75';
    'heat1>75'};
rot(i).use=[9;8;4;6;3;2;1;5];