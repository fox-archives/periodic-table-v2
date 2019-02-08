#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods-old.wls"}];
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

fixAtomicRadius[x_]:= (
	If[FailureQ[x],
		Return["Failed"];
	];
	If[MissingQ[x],
		Return["Unknown"];,
		Return[UnitConvert@N@QuantityMagnitude[x]];
	];
)

fixValence[x_]:= (
	If[FailureQ[x],
		Return["Failed"];
	];
	If[MissingQ[x],
		Return["Unknown"];,
		Return[UnitConvert@QuantityMagnitude[x]];
	];
)

periodicTable = {};

elementList = EntityList[Entity["Element"]];
Print["Properties.wls creating properties"];
For[i = 1, i < 119, i++,
	myElementEntity = elementList[[i]];

	name = CanonicalName@myElementEntity;
	abbreviation = ElementData[myElementEntity, "Abbreviation"];
	atomicNumber = ElementData[myElementEntity, "AtomicNumber"];

	(* ATOMIC PROPERTIES *)
	atomicRadius = ElementData[myElementEntity, "AtomicRadius"] // fixAtomicRadius;
	covalentRadius = ElementData[myElementEntity, "CovalentRadius"] // fixAtomicRadius;
	inizationEnergies = ElementData[myElementEntity, "IonizationEnergies"] // fixAtomicRadius;
	vanDerWaalsRadius = ElementData[myElementEntity, "VanDerWaalsRadius"] // fixAtomicRadius;
	neuronCount = "";
	electronCount = "";
	valence = ElementData[myElementEntity, "Valence"] // fixValence;
	electronegativity = ElementData[myElementEntity, "Electronegativity"] // fixAtomicRadius;
	electronAffinity = ElementData[myElementEntity, "ElectronAffinity"] // fixAtomicRadius;


	(* THERMODYNAMIC PROPERTIES *)
	abiabaticIndex = ElementData[myElementEntity, "AdiabaticIndex"] // fixAtomicRadius;
	boilingPoint = ElementData[myElementEntity, "BoilingPoint"] // fixAtomicRadius;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // fixAtomicRadius;
	criticalPressure = ElementData[myElementEntity, "CriticalPressure"] // fixAtomicRadius;
	criticalTemperature = ElementData[myElementEntity, "CriticalTemperature"] // fixAtomicRadius;
	curiePoint = ElementData[myElementEntity, "CuriePoint"] // fixAtomicRadius;
	fusionHeat = ElementData[myElementEntity, "FusionHeat"] // fixAtomicRadius;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // fixAtomicRadius;
	neelPoint = ElementData[myElementEntity, "NeelPoint"] // fixAtomicRadius;
	(* phase = ElementData[myElementEntity, "Phase"] // fixAtomicRadius; *)
	specificHeat = ElementData[myElementEntity, "SpecificHeat"] // fixAtomicRadius;
	superconductingPoint = ElementData[myElementEntity, "SuperconductingPoint"] // fixAtomicRadius;
	vaporizationHeat = ElementData[myElementEntity, "VaporizationHeat"] // fixAtomicRadius;
	(* Skipping Some *)

	newElementObject = {
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicRadius" -> atomicRadius,
		"covalentRadius" -> covalentRadius,
		(* "inizationEnergies" - inizationEnergies, *)
		"vanDerWaalsRadius" -> vanDerWaalsRadius,
		"valence" -> valence,
		"electronegativity" -> electronegativity,
		"electronAffinity" -> electronAffinity,

		(* THERMODYNAMIC PROPERTIES *)
		"adiabaticIndex" -> abiabaticIndex,
		"boilingPoint" -> boilingPoint,
		"meltingPoint" -> meltingPoint,
		"criticalPressure" -> criticalPressure,
		"criticalTemperature" -> criticalTemperature,
		"curiePoint" -> curiePoint,
		"fusionHeat" -> fusionHeat,
		"meltingPoint" -> meltingPoint,
		"neelPoint" -> neelPoint,
		(* "phase" -> phase *)
		"specificHeat" -> specificHeat,
		"superconductingPoint" -> superconductingPoint,
		"vaporizationHeat" -> vaporizationHeat
	};

	Print@newElementObject;

	periodicTable = Append[periodicTable, newElementObject];
];

deleteExistingFile["tab-properties-data.json"];
Export["tab-properties-data.json", periodicTable, "JSON"];



