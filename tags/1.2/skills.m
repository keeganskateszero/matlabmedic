%This file is a rework of Theck's original talents.m file from 
%http://code.google.com/p/matlabadin/source/browse/tags/v4.3.2-final/talent
%s.m

%This file handles and updates a player's skill spec.  The
%'tree' array contains matrices representing the talent trees, from which
%values are loaded into the individual talents.  This gives us an easy and
%compact way to store and load default builds.

%Skills are stored in the tree matrices by absolute position in the
%Nx4 grid of the talent tree.
%Individual talents entries are stored in the "talent" structure, in the form
%skill(ii).Skill(Name, which would return the number of points spent in
%SkillName.

%One can edit skill(1).X directly in m-files if desired for a certain
%simulation.  Example:  skill(1).ImprovedVents=1 would allocate one point in
%ImprovedVents.  Note however that re-running the "skills" m-file will undo
%this change and revert to whatever build is stored in "tree"

%%Skills 1
skill(1).setup=1;
%SC 2/2, PI 1/2, CM 0/1
% Bodyguard
skill(1).Bodyguard=...
    [0 0 1 0; ...
    0 0 5 0; ...
    1 2 1 0; ...
    0 1 3 2; ...
    0 2 1 0; ...
    2 0 1 2; ...
    0 2 2 3];

skill(1).ImprovedVents=skill(1).Bodyguard(7,2);
skill(1).MedTech=skill(1).Bodyguard(7,3);
skill(1).HiredMuscle=skill(1).Bodyguard(7,4);
skill(1).EmpoweredScans=skill(1).Bodyguard(6,1);
skill(1).SurgicalPrecisionSystem=skill(1).Bodyguard(6,2);
skill(1).SuperchargedGas=skill(1).Bodyguard(6,3);
skill(1).CriticalReaction=skill(1).Bodyguard(6,4);
skill(1).HeatDamping=skill(1).Bodyguard(5,1);
skill(1).KoltoResidue=skill(1).Bodyguard(5,2);
skill(1).KoltoMissile=skill(1).Bodyguard(5,3);
skill(1).PowerShield=skill(1).Bodyguard(5,4);
skill(1).PoweredInsulators=skill(1).Bodyguard(4,2);
skill(1).CriticalEfficiency=skill(1).Bodyguard(4,3);
skill(1).ProtectiveField=skill(1).Bodyguard(4,4);
skill(1).ReactiveArmor=skill(1).Bodyguard(3,1);
skill(1).ProactiveMedicine=skill(1).Bodyguard(3,2);
skill(1).KoltoShell=skill(1).Bodyguard(3,3);
skill(1).CureMind=skill(1).Bodyguard(3,4);
skill(1).Warden=skill(1).Bodyguard(2,3);
skill(1).EmergencyScan=skill(1).Bodyguard(1,3);

skill(1).Bodyguardpoints=sum(sum(skill(1).Bodyguard));

% Arsenal
skill(1).Arsenal=...
    [0 0 1 0; ...
    0 2 2 3];


skill(1).MandalorianIronWarheads=skill(1).Arsenal(2,2);
skill(1).IntegratedSystems=skill(1).Arsenal(2,3);
skill(1).Ironsights=skill(1).Arsenal(2,4);
skill(1).Stabilizers=skill(1).Arsenal(1,1);
skill(1).MuzzleFluting=skill(1).Arsenal(1,2);
skill(1).UpgradedArsenal=skill(1).Arsenal(1,3);
skill(1).CustomEnviroSuit=skill(1).Arsenal(1,4);

skill(1).Arsenalpoints=sum(sum(skill(1).Arsenal));

% Pyrotech
skill(1).Pyrotech=...
    [0 0 0 0;...
    0 0 2 0];

skill(1).AdvancedTraining=skill(1).Pyrotech(2,2);
skill(1).SystemCalibrations=skill(1).Pyrotech(2,3);
skill(1).IntegratedCardioPackage=skill(1).Pyrotech(2,4);
skill(1).SuperheatedGas=skill(1).Pyrotech(1,2);
skill(1).SwelteringHeat=skill(1).Pyrotech(1,3);
skill(1).GyroscopicAlignmentJets=skill(1).Pyrotech(1,4);

skill(1).Pyrotechpoints=sum(sum(skill(1).Pyrotech));




%% Skills 2
%SC 0/2, PI 2/2, CM 1/1
% Bodyguard
ii=2;
skill(ii).Bodyguard=...
    [0 0 1 0; ...
    0 0 5 0; ...
    1 2 1 1; ...
    0 2 3 2; ...
    0 2 1 0; ...
    2 0 1 2; ...
    0 2 2 3];
skill(ii).ImprovedVents=skill(ii).Bodyguard(7,2);
skill(ii).MedTech=skill(ii).Bodyguard(7,3);
skill(ii).HiredMuscle=skill(ii).Bodyguard(7,4);
skill(ii).EmpoweredScans=skill(ii).Bodyguard(6,1);
skill(ii).SurgicalPrecisionSystem=skill(ii).Bodyguard(6,2);
skill(ii).SuperchargedGas=skill(ii).Bodyguard(6,3);
skill(ii).CriticalReaction=skill(ii).Bodyguard(6,4);
skill(ii).HeatDamping=skill(ii).Bodyguard(5,1);
skill(ii).KoltoResidue=skill(ii).Bodyguard(5,2);
skill(ii).KoltoMissile=skill(ii).Bodyguard(5,3);
skill(ii).PowerShield=skill(ii).Bodyguard(5,4);
skill(ii).PoweredInsulators=skill(ii).Bodyguard(4,2);
skill(ii).CriticalEfficiency=skill(ii).Bodyguard(4,3);
skill(ii).ProtectiveField=skill(ii).Bodyguard(4,4);
skill(ii).ReactiveArmor=skill(ii).Bodyguard(3,1);
skill(ii).ProactiveMedicine=skill(ii).Bodyguard(3,2);
skill(ii).KoltoShell=skill(ii).Bodyguard(3,3);
skill(ii).CureMind=skill(ii).Bodyguard(3,4);
skill(ii).Warden=skill(ii).Bodyguard(2,3);
skill(ii).EmergencyScan=skill(ii).Bodyguard(1,3);

skill(ii).Bodyguardpoints=sum(sum(skill(ii).Bodyguard));

% Arsenal
skill(ii).Arsenal=...
    [0 0 1 0; ...
    0 2 2 3];

skill(ii).MandalorianIronWarheads=skill(ii).Arsenal(2,2);
skill(ii).IntegratedSystems=skill(ii).Arsenal(2,3);
skill(ii).Ironsights=skill(ii).Arsenal(2,4);
skill(ii).Stabilizers=skill(ii).Arsenal(1,1);
skill(ii).MuzzleFluting=skill(ii).Arsenal(1,2);
skill(ii).UpgradedArsenal=skill(ii).Arsenal(1,3);
skill(ii).CustomEnviroSuit=skill(ii).Arsenal(1,4);

skill(ii).Arsenalpoints=sum(sum(skill(ii).Arsenal));

% Pyrotech
skill(ii).Pyrotech=...
    [0 0 0 0; ...
    0 0 0 0];

skill(ii).AdvancedTraining=skill(ii).Pyrotech(2,2);
skill(ii).SystemCalibrations=skill(ii).Pyrotech(2,3);
skill(ii).IntegratedCardioPackage=skill(ii).Pyrotech(2,4);
skill(ii).SuperheatedGas=skill(ii).Pyrotech(1,2);
skill(ii).SwelteringHeat=skill(ii).Pyrotech(1,3);
skill(ii).GyroscopicAlignmentJets=skill(ii).Pyrotech(1,4);

skill(ii).Pyrotechpoints=sum(sum(skill(ii).Pyrotech));

%% Skills 3
% Bodyguard
ii=ii+1;
skill(ii)=skill(1);
skill(ii).Bodyguard=...
    [0 0 1 0; ...
    0 0 5 0; ...
    1 2 1 0; ...
    0 1 3 2; ...
    0 2 1 0; ...
    2 0 1 2; ...
    0 2 2 3];
skill(ii).ImprovedVents=skill(ii).Bodyguard(7,2);
skill(ii).MedTech=skill(ii).Bodyguard(7,3);
skill(ii).HiredMuscle=skill(ii).Bodyguard(7,4);
skill(ii).EmpoweredScans=skill(ii).Bodyguard(6,1);
skill(ii).SurgicalPrecisionSystem=skill(ii).Bodyguard(6,2);
skill(ii).SuperchargedGas=skill(ii).Bodyguard(6,3);
skill(ii).CriticalReaction=skill(ii).Bodyguard(6,4);
skill(ii).HeatDamping=skill(ii).Bodyguard(5,1);
skill(ii).KoltoResidue=skill(ii).Bodyguard(5,2);
skill(ii).KoltoMissile=skill(ii).Bodyguard(5,3);
skill(ii).PowerShield=skill(ii).Bodyguard(5,4);
skill(ii).PoweredInsulators=skill(ii).Bodyguard(4,2);
skill(ii).CriticalEfficiency=skill(ii).Bodyguard(4,3);
skill(ii).ProtectiveField=skill(ii).Bodyguard(4,4);
skill(ii).ReactiveArmor=skill(ii).Bodyguard(3,1);
skill(ii).ProactiveMedicine=skill(ii).Bodyguard(3,2);
skill(ii).KoltoShell=skill(ii).Bodyguard(3,3);
skill(ii).CureMind=skill(ii).Bodyguard(3,4);
skill(ii).Warden=skill(ii).Bodyguard(2,3);
skill(ii).EmergencyScan=skill(ii).Bodyguard(1,3);

skill(ii).Bodyguardpoints=sum(sum(skill(ii).Bodyguard));

% Arsenal
skill(ii).Arsenal=[0 0 1 0; ...
    0 2 2 3];


skill(ii).MandalorianIronWarheads=skill(ii).Arsenal(2,2);
skill(ii).IntegratedSystems=skill(ii).Arsenal(2,3);
skill(ii).Ironsights=skill(ii).Arsenal(2,4);
skill(ii).Stabilizers=skill(ii).Arsenal(1,1);
skill(ii).MuzzleFluting=skill(ii).Arsenal(1,2);
skill(ii).UpgradedArsenal=skill(ii).Arsenal(1,3);
skill(ii).CustomEnviroSuit=skill(ii).Arsenal(1,4);

skill(ii).Arsenalpoints=sum(sum(skill(ii).Arsenal));

% Pyrotech
skill(ii).Pyrotech=[0 0 0 0; ...
    0 0 0 0];


skill(ii).AdvancedTraining=skill(ii).Pyrotech(2,2);
skill(ii).SystemCalibrations=skill(ii).Pyrotech(2,3);
skill(ii).IntegratedCardioPackage=skill(ii).Pyrotech(2,4);
skill(ii).SuperheatedGas=skill(ii).Pyrotech(1,2);
skill(ii).SwelteringHeat=skill(ii).Pyrotech(1,3);
skill(ii).GyroscopicAlignmentJets=skill(ii).Pyrotech(1,4);

skill(ii).Pyrotechpoints=sum(sum(skill(ii).Pyrotech));





%% Skills 4
% Bodyguard
ii=ii+1;
skill(ii).Bodyguard=[0 0 1 0; ...
    0 0 5 0; ...
    1 2 1 0; ...
    0 1 3 2; ...
    0 2 1 0; ...
    2 0 1 2; ...
    0 2 2 3];
skill(ii).ImprovedVents=skill(ii).Bodyguard(7,2);
skill(ii).MedTech=skill(ii).Bodyguard(7,3);
skill(ii).HiredMuscle=skill(ii).Bodyguard(7,4);
skill(ii).EmpoweredScans=skill(ii).Bodyguard(6,1);
skill(ii).SurgicalPrecisionSystem=skill(ii).Bodyguard(6,2);
skill(ii).SuperchargedGas=skill(ii).Bodyguard(6,3);
skill(ii).CriticalReaction=skill(ii).Bodyguard(6,4);
skill(ii).HeatDamping=skill(ii).Bodyguard(5,1);
skill(ii).KoltoResidue=skill(ii).Bodyguard(5,2);
skill(ii).KoltoMissile=skill(ii).Bodyguard(5,3);
skill(ii).PowerShield=skill(ii).Bodyguard(5,4);
skill(ii).PoweredInsulators=skill(ii).Bodyguard(4,2);
skill(ii).CriticalEfficiency=skill(ii).Bodyguard(4,3);
skill(ii).ProtectiveField=skill(ii).Bodyguard(4,4);
skill(ii).ReactiveArmor=skill(ii).Bodyguard(3,1);
skill(ii).ProactiveMedicine=skill(ii).Bodyguard(3,2);
skill(ii).KoltoShell=skill(ii).Bodyguard(3,3);
skill(ii).CureMind=skill(ii).Bodyguard(3,4);
skill(ii).Warden=skill(ii).Bodyguard(2,3);
skill(ii).EmergencyScan=skill(ii).Bodyguard(1,3);

skill(ii).Bodyguardpoints=sum(sum(skill(ii).Bodyguard));

% Arsenal
skill(ii).Arsenal=[0 0 1 0; ...
    0 2 2 3];

skill(ii).MandalorianIronWarheads=skill(ii).Arsenal(2,2);
skill(ii).IntegratedSystems=skill(ii).Arsenal(2,3);
skill(ii).Ironsights=skill(ii).Arsenal(2,4);
skill(ii).Stabilizers=skill(ii).Arsenal(1,1);
skill(ii).MuzzleFluting=skill(ii).Arsenal(1,2);
skill(ii).UpgradedArsenal=skill(ii).Arsenal(1,3);
skill(ii).CustomEnviroSuit=skill(ii).Arsenal(1,4);

skill(ii).Arsenalpoints=sum(sum(skill(ii).Arsenal));

% Pyrotech
skill(ii).Pyrotech=[0 0 0 0; ...
    0 0 2 0];

skill(ii).AdvancedTraining=skill(ii).Pyrotech(2,2);
skill(ii).SystemCalibrations=skill(ii).Pyrotech(2,3);
skill(ii).IntegratedCardioPackage=skill(ii).Pyrotech(2,4);
skill(ii).SuperheatedGas=skill(ii).Pyrotech(1,2);
skill(ii).SwelteringHeat=skill(ii).Pyrotech(1,3);
skill(ii).GyroscopicAlignmentJets=skill(ii).Pyrotech(1,4);

skill(ii).Pyrotechpoints=sum(sum(skill(ii).Pyrotech));

%% Skills 5
% Bodyguard
ii=ii+1;
skill(ii)=skill(1);
skill(ii).Bodyguard=[0 0 1 0; ...
    0 0 5 0; ...
    1 2 1 0; ...
    0 1 3 2; ...
    0 2 1 0; ...
    2 0 1 2; ...
    0 2 2 3];
skill(ii).ImprovedVents=skill(ii).Bodyguard(7,2);
skill(ii).MedTech=skill(ii).Bodyguard(7,3);
skill(ii).HiredMuscle=skill(ii).Bodyguard(7,4);
skill(ii).EmpoweredScans=skill(ii).Bodyguard(6,1);
skill(ii).SurgicalPrecisionSystem=skill(ii).Bodyguard(6,2);
skill(ii).SuperchargedGas=skill(ii).Bodyguard(6,3);
skill(ii).CriticalReaction=skill(ii).Bodyguard(6,4);
skill(ii).HeatDamping=skill(ii).Bodyguard(5,1);
skill(ii).KoltoResidue=skill(ii).Bodyguard(5,2);
skill(ii).KoltoMissile=skill(ii).Bodyguard(5,3);
skill(ii).PowerShield=skill(ii).Bodyguard(5,4);
skill(ii).PoweredInsulators=skill(ii).Bodyguard(4,2);
skill(ii).CriticalEfficiency=skill(ii).Bodyguard(4,3);
skill(ii).ProtectiveField=skill(ii).Bodyguard(4,4);
skill(ii).ReactiveArmor=skill(ii).Bodyguard(3,1);
skill(ii).ProactiveMedicine=skill(ii).Bodyguard(3,2);
skill(ii).KoltoShell=skill(ii).Bodyguard(3,3);
skill(ii).CureMind=skill(ii).Bodyguard(3,4);
skill(ii).Warden=skill(ii).Bodyguard(2,3);
skill(ii).EmergencyScan=skill(ii).Bodyguard(1,3);

skill(ii).Bodyguardpoints=sum(sum(skill(ii).Bodyguard));

% Arsenal
skill(ii).Arsenal=[0 0 1 0; ...
    0 2 2 3];


skill(ii).MandalorianIronWarheads=skill(ii).Arsenal(2,2);
skill(ii).IntegratedSystems=skill(ii).Arsenal(2,3);
skill(ii).Ironsights=skill(ii).Arsenal(2,4);
skill(ii).Stabilizers=skill(ii).Arsenal(1,1);
skill(ii).MuzzleFluting=skill(ii).Arsenal(1,2);
skill(ii).UpgradedArsenal=skill(ii).Arsenal(1,3);
skill(ii).CustomEnviroSuit=skill(ii).Arsenal(1,4);

skill(ii).Arsenalpoints=sum(sum(skill(ii).Arsenal));

% Pyrotech
skill(ii).Pyrotech=[0 0 0 0; ...
    0 0 0 0];

skill(ii).AdvancedTraining=skill(ii).Pyrotech(2,2);
skill(ii).SystemCalibrations=skill(ii).Pyrotech(2,3);
skill(ii).IntegratedCardioPackage=skill(ii).Pyrotech(2,4);
skill(ii).SuperheatedGas=skill(ii).Pyrotech(1,2);
skill(ii).SwelteringHeat=skill(ii).Pyrotech(1,3);
skill(ii).GyroscopicAlignmentJets=skill(ii).Pyrotech(1,4);

skill(ii).Pyrotechpoints=sum(sum(skill(ii).Pyrotech));

