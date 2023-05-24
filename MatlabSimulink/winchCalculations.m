%Master thesis 2023, Kristian Rakvåg
%Winch calculations
clc; close all; clear;

%Defining constants
wireDiameter = 0.003; %3mm
diameterRatio = 18;
minDrumPitchDiameter = wireDiameter*diameterRatio;
minDrumDiameter = minDrumPitchDiameter-wireDiameter;
velocityRequirement = 1; %m/s
payloadMass = 15; %kg
gravity = 9.81; %m/s^2
numberOfSheaves = 4;
efficiencySheaves = 0.97;
efficiencyGearAtFullLoad = 0.94;

%Safety factors
loadFactor = 1.3;
dynamicFactor = 1.3;
materialFactor = 1;%1.15;
safetyFactor = loadFactor*dynamicFactor*materialFactor;
%safetyFactor = dynamicFactor;

designLoad = payloadMass*gravity*safetyFactor; % Newtons
designLoadWinch = designLoad/(efficiencySheaves^numberOfSheaves);
fleetAngleSpooling = 5; %degrees
designLoadBearingAxial = designLoadWinch * sind(fleetAngleSpooling);

%Drum calculations

winchDrumRadius = 0.07;
winchDrumDiameter = winchDrumRadius*2;
winchGearTorque = designLoadWinch*(winchDrumRadius+wireDiameter/2+0.3e-3);
winchGearTorque2ndLayer = designLoadWinch*(winchDrumRadius+wireDiameter*3/2+0.3e-3);
winchGearRatio = 32;
winchMotorTorque = winchGearTorque/(winchGearRatio*efficiencyGearAtFullLoad);
winchMotorTorque2ndLayer = winchGearTorque2ndLayer/(winchGearRatio*efficiencyGearAtFullLoad);
winchDrumVelocity = velocityRequirement/winchDrumRadius;
winchDrumVelocityRPM = velocityRequirement/winchDrumRadius*(60/(2*pi));
winchMotorVelocity = winchDrumVelocity*winchGearRatio;
winchMotorVelocityRPM = winchDrumVelocity*winchGearRatio*(60/(2*pi));

%Groove calculations
grooveRadiusDrum = 0.54*wireDiameter;
groovePitchDiameter = 2.1*grooveRadiusDrum;
grooveDepth = 0.4*wireDiameter;

grooveRadiusDrummm = 0.54*3;
groovePitchDiametermm = 2.1*grooveRadiusDrummm;
grooveDepthmm = 0.4*3;

wirePitchDiameter = 0.1405;

%Hoop stress calculation
Cfactor = 1.75;
ropeTension = designLoadWinch;
pitchRopeGrooving = wireDiameter*1.1;
thicknessDrum = 0.005; %10mm
hoopStress = Cfactor*ropeTension / (groovePitchDiameter*thicknessDrum);
hoopStressMPa = hoopStress/1e6;

% %Hoop stress thin wall
% meanRadius = 0.065;
% hoopStressThinWall = 

%Flange pressure calculation;
flangePressure = 2*thicknessDrum*hoopStress / 3*winchDrumDiameter;
flangePressureMPa = flangePressure/1e6;

%Required drum width
liftingHeight = 3.5;
workingTurnsOnDrum = 1 + liftingHeight/(pi*(winchDrumDiameter+wireDiameter));


turnsOnDrum = 3;
spareTurns = 3;
drumTurns = workingTurnsOnDrum + turnsOnDrum + spareTurns;
drumWidth = drumTurns*wireDiameter*1.1;

%Actual drum sizes
circumferenceDrumWire = (pi*(winchDrumDiameter+wireDiameter));
capacityDrum = circumferenceDrumWire*28

% %Required drum width
% liftingHeight = 2.5;
% workingTurnsOnDrum = 1 + liftingHeight/(pi*(winchDrumDiameter+wireDiameter))
% turnsOnDrum = 5;
% spareTurns = 3;
% drumTurns = workingTurnsOnDrum + turnsOnDrum + spareTurns;
% drumWidth = drumTurns*wireDiameter*1.1


% Groove radius (r):
% Minimum 0.53 to 0.535 x d
% Maximum 0.55 x d
% 
% Pitch diameter (p):
% The pitch dia. has to be chosen in accordance with the groove radius. Under no circumstance should the pitch dia. be smaller than:
% • Minimum 2.065 x groove radius
% • Maximum 2.18 x groove radius
% 
% If these values are applied to single layer grooved drums the maximum permissible rope-deflection angle for regular wire rope constructions is 4°. For non rotating /rotation-resistant ropes the maximum permissible deflection angle is 1.5° only.
% 
% Groove depth (h):
% Minimum ≥ 0.374 x d for helically grooved drums