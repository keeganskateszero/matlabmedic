%% Heals

%Rapid Scan 1 
healmin.RapidScan=(.116*7085+2.72*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
healmax.RapidScan=(.156*7085+2.72*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
heatcost.RapidScan=25;
amount.RapidScan=1;
cast.RapidScan=(2.5-.25*skill(s).MedTech);

%Rapid Scan after HS 2 
healmin.RapidScan9=(.116*7085+2.72*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
healmax.RapidScan9=(.156*7085+2.72*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
heatcost.RapidScan9=17;
amount.RapidScan9=1;
cast.RapidScan9=(2.5-.25*skill(s).MedTech);


%Healing Scan 3
healmin.HealingScan=(.077*7085+1.94*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
healmax.HealingScan=(.117*7085+1.94*player.HBonus)*(1+.03*skill(s).EmpoweredScans+.01*skill(s).IntegratedSystems);
heatcost.HealingScan=16;
amount.HealingScan=1;
cast.HealingScan=1.5;

%Emergency Scan 4
healmin.EmergencyScan=(.084*7085+2.28*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
healmax.EmergencyScan=(.144*7085+2.28*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
heatcost.EmergencyScan=0;
amount.EmergencyScan=1;
cast.EmergencyScan=0;

%Rapid Shots 5
healmin.RapidShots=(.334*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
healmax.RapidShots=(.334*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
heatcost.RapidShots=0;
amount.RapidShots=3;
cast.RapidShots=0;

%Kolto Missile 6
healmin.KoltoMissile=(.034*7085+.108*player.HBonus)*(1+.01*skill(s).IntegratedSystems+.1*skill(s).MandalorianIronWarheads);
healmax.KoltoMissile=(.074*7085+.108*player.HBonus)*(1+.01*skill(s).IntegratedSystems+.1*skill(s).MandalorianIronWarheads);
heatcost.KoltoMissile=16;
amount.KoltoMissile=4;
cast.KoltoMissile=0;

%Kolto Shell 7
healmin.KoltoShell=0;
healmax.KoltoShell=0;
healmin.KoltoShell1=(.022*7085+.481*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
healmax.KoltoShell1=(.026*7085+.481*player.HBonus)*(1+.01*skill(s).IntegratedSystems);
heatcost.KoltoShell=16;
amount.KoltoShell=1;
cast.KoltoShell=0;

%Supercharged Gas 8
healmin.SuperchargedGas=0;
healmax.SuperchargedGas=0;
heatcost.SuperchargedGas=-8;
amount.SuperchargedGas=1;
cast.SuperchargedGas=0;

%Proactive Medicine 9
healmin.ProactiveMedicine=(.014*7085+.26*player.HBonus)*(1+.01*skill(s).IntegratedSystems);

%% Useful Abilities

%Vent Heat 10
healmin.VentHeat=0;
healmax.VentHeat=0;
heatcost.VentHeat=-(34+8*skill(s).ImprovedVents);
amount.VentHeat=1;
cast.VentHeat=0;

%Thermal Systems Override 11
healmin.ThermalSystemsOverride=0;
healmax.ThermalSystemsOverride=0;
heatcost.ThermalSystemsOverride=0;
amount.ThermalSystemsOverride=0;
cast.ThermalSystemsOverride=0;

%Power Surge 12
healmin.PowerSurge=0;
healmax.PowerSurge=0;
heatcost.PowerSurge=0;
amount.PowerSurge=0;
cast.PowerSurge=0;

val.healmin=[round(healmin.RapidScan);
   round(healmin.RapidScan9);
   round(healmin.HealingScan);
   round(healmin.EmergencyScan);
   round(healmin.RapidShots);
   round(healmin.KoltoMissile);
   round(healmin.KoltoShell);
   round(healmin.SuperchargedGas);
   round(healmin.VentHeat);
   round(healmin.ThermalSystemsOverride);
   round(healmin.PowerSurge)];

val.healmax=[round(healmax.RapidScan);
   round(healmax.RapidScan9);
   round(healmax.HealingScan);
   round(healmax.EmergencyScan);
   round(healmax.RapidShots);
   round(healmax.KoltoMissile);
   round(healmax.KoltoShell);
   round(healmax.SuperchargedGas);
   round(healmax.VentHeat);
   round(healmax.ThermalSystemsOverride);
   round(healmax.PowerSurge)];

val.heatcost=[heatcost.RapidScan;
   heatcost.RapidScan9;
   heatcost.HealingScan;
   heatcost.EmergencyScan;
   heatcost.RapidShots;
   heatcost.KoltoMissile;
   heatcost.KoltoShell;
   heatcost.SuperchargedGas;
   heatcost.VentHeat;
   heatcost.ThermalSystemsOverride;
   heatcost.PowerSurge];

val.amount=[amount.RapidScan;
   amount.RapidScan9;
   amount.HealingScan;
   amount.EmergencyScan;
   amount.RapidShots;
   amount.KoltoMissile;
   amount.KoltoShell;
   amount.SuperchargedGas;
   amount.VentHeat;
   amount.ThermalSystemsOverride;
   amount.PowerSurge];

val.cast=[cast.RapidScan;
   cast.RapidScan9;
   cast.HealingScan;
   cast.EmergencyScan;
   cast.RapidShots;
   cast.KoltoMissile;
   cast.KoltoShell;
   cast.SuperchargedGas;
   cast.VentHeat;
   cast.ThermalSystemsOverride;
   cast.PowerSurge];


