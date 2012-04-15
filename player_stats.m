%This file calculates your characters stats that are used in the simulator.

if x==1 %BiS going into 1.2
    player.aim=(1722+18*mods(v1,7));
    player.endurance=1750;
    player.power=1361+18*mods(v1,8)+11*mods(v1,3)+41*mods(v1,1)+37*mods(v1,5);
    player.surgerat=0+51*mods(v1,5);
    player.critrat=117+11*mods(v1,4)+41*mods(v1,2);
    player.alacrat=144+51*mods(v1,6);
    player.cunning=112;
    player.armor=4735;
    player.buff = [1,1,1,1];
    player.setbonus = [1,1,0,0];
elseif x==2 %Black Hole BiS
    player.aim=(1793+18*mods(v1,7));
    player.endurance=1750;
    player.power=1645+18*mods(v1,8)+41*mods(v1,3)+41*mods(v1,1)+41*mods(v1,5);
    player.surgerat=57+57*mods(v1,5);
    player.critrat=24+41*mods(v1,3)+41*mods(v1,2);
    player.alacrat=114+57*mods(v1,4);
    player.cunning=112;
    player.armor=4735;
    player.buff = [1,1,1,1];
    player.setbonus = [1,1,0,0];
elseif x==3 %Overall BiS
    player.aim=(1865+18*mods(v1,7));
    player.endurance=1750;
    player.power=1645+18*mods(v1,8)+41*mods(v1,3)+41*mods(v1,1)+41*mods(v1,5);
    player.surgerat=57+57*mods(v1,5);
    player.critrat=24+41*mods(v1,4)+41*mods(v1,2);
    player.alacrat=114+57*mods(v1,6);
    player.cunning=112;
    player.armor=4735;
    player.buff = [1,1,1,1];
    player.setbonus = [1,1,0,0];
end
%% Buffs

player.buffMoP = player.buff(1);
player.buffUM = player.buff(2);
player.buffHB = player.buff(3);
player.buffCO = player.buff(4);
player.aim = player.aim*(1+.05*player.buffMoP+.03*skill(s).Ironsights);
player.cunning = player.cunning*(1+.05*player.buffMoP);

%% Set Bonuses


%% Stat Calculations
player.HBonus=(.14*player.aim+.17*player.power)*(1+.05*player.buffUM);
player.DBonus=(.20*player.aim+.23*player.power)*(1+.05*player.buffUM);
player.critchance=(30*(1-((1-(0.01/0.3)).^(((player.aim)/50)/2.5)))+(30*(1-((1-(0.01/0.3)).^(((player.critrat)/50)/.45))))+30*...
    (1-((1-(0.01/0.3)).^(((player.cunning)/50)/2.5)))+(1*skill(s).HiredMuscle)+(3*skill(s).UpgradedArsenal)+5*player.buffCO)/100;
player.critperc=(1.5+.03*skill(s).Warden+(.30*(1-(1-(0.01/0.3))^((player.surgerat/50)/.11))));
player.castreduc=(1-0.3*(1-(1-(0.01/.3))^((player.alacrat/50)/.55)))-.02*skill(s).SystemCalibrations;
player.damagereduc=player.armor/(player.armor+200*50+800)*10;
player.health = 2500+10*(player.endurance*(1+.05*player.buffHB));
