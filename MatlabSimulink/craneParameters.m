%Master thesis 2023, Kristian Rakvåg
%Simulink parameters file. Run this file before Simulink model to load
%parameters and set correct project folder.
clc; close all; clear;

 %Platform constants
fHeightPlatform = 1.402;
fHeightPlatformKing = 0.09;
fLengthPlatform = 1.30;

%Crane and platform dimensions
%Crane constant parameters

fHeightKingSlew             = 0.623;
fHeightSlewTop              = 0.711;
fLengthMainArm			    = 1.5;
fLengthKnuckleArm		    = 1.158;

fLengthKingActLower  		    = 0.154;
fHeightKingActLower  		    = 0.161;
fLengthKingActUpper  		    = 0.600;
fHeightKingActUpper   		    = 0.130;

fLengthKnuckleActLower  		    = 0.750;
fHeightKnuckleActLower  		    = 0.160;
fLengthKnuckleActUpper  		    = 0.027;
fHeightKnuckleActUpper   		    = 0.182;

fLengthAMain				= 0.614;
fLengthBMain				= 0.571;
fMinLengthActuatorMain		= 0.691; %OLD 0.692
fMaxStrokeActuatorMain		= 0.320;
fOffsetAngleDegMain			= 7.58;
fOffsetAngleRadMain         = deg2rad(fOffsetAngleDegMain);
fOffsetAngleDegMainAct		= 69.7;

fLengthAKnuckle				= 0.767;
fLengthBKnuckle				= 0.1855;
fMinLengthActuatorKnuckle	= 0.633;
fMaxStrokeActuatorKnuckle	= 0.260;
fOffsetAngleDegKnuckle		= 86.74;
fOffsetAngleRadKnuckle      = deg2rad(fOffsetAngleDegKnuckle);
fOffsetAngleDegKnuckleAct	= 82.85;

%Winch and sheave dimensions
wireDiameter = 0.003; %3mm
winchGearRatio = 32;

fLengthToWinch = 0.22;
fHeightToWinch = 0.0895;
fLengthToSheave1 = 0.235;
fHeightToSheave1 = 0.060;
fLengthToSheave2 = 1.520;
fHeightToSheave2 = 0.095;
fLengthToSheave3 = 0.168;
fHeightToSheave3 = 0.198;
fLengthToSheave4 = 0;
fHeightToSheave4 = 1.158;

%Masses in kg
massTestRigPlatform = 268;
massTestRigBase = 924;
massTestRigCyl = 16;
massTestRigCylRod = 5.4;

massPayload = 13.5; %kg
massKingBottom = 92.2;
massKingTop = 63.6;
massKingMountingPlate = 58.2;
massKingGear = 4.0;
massMainArm = 12.5;
massKnuckleArm = 8.7;
massSheave = 0.254;
massActuatorBottomMain = 14;
massActuatorBottomRod = 3;
massActuatorTopMain = 14;
massActuatorTopRod = 3;
massWinch = 4.8;
massWinchDrum = 2.3;

%WinchParameters
winchGrooveDiameter = 0.1402;
winchPitchDiameter = winchGrooveDiameter + wireDiameter;
winchPitchDiameterLayer2 = winchGrooveDiameter + 2*wireDiameter;
winchPitchRadius = winchPitchDiameter/2;
winchPitchRadiusLayer2 = winchPitchDiameterLayer2/2;

sheaveGrooveDiameter = 0.065;
sheavePitchDiameter = sheaveGrooveDiameter + wireDiameter;
sheavePitchRadius = sheavePitchDiameter/2;

