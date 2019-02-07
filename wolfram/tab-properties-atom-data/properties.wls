#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods-old.wls"}];
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

fixAtomicRadiusValue[x_]:= (
	If[FailureQ[x],
		Return["Failed"];
	];
	If[MissingQ[x],
		Return["Unknown"];,
		Return[UnitConvert@N@QuantityMagnitude[x]];
	];
)

fixValenceValue[x_]:= (
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

	nameValue = CanonicalName@myElementEntity;

	abbreviationValue = ElementData[myElementEntity, "Abbreviation"];

	atomicNumberValue = ElementData[myElementEntity, "AtomicNumber"];

	(* ATOMIC PROPERTIES *)
	atomicRadiusValue = ElementData[myElementEntity, "AtomicRadius"] // fixAtomicRadiusValue;

	covalentRadiusValue = ElementData[myElementEntity, "CovalentRadius"] // fixAtomicRadiusValue;

	vanDerWaalsRadiusValue = ElementData[myElementEntity, "VanDerWaalsRadius"] // fixAtomicRadiusValue;

	(* protonCountValue = ElementData[myElementEntity, "ProtonCount"] // fixAtomicRadiusValue; *)
	neuronCountValue = "";
	electronCountValue = "";
	valenceValue = ElementData[myElementEntity, "Valence"] // fixValenceValue;

	electronegativityValue = ElementData[myElementEntity, "Electronegativity"] // fixAtomicRadiusValue;

	electronAffinityValue = ElementData[myElementEntity, "ElectronAffinity"] // fixAtomicRadiusValue;

	(* Divide *)

	(* THERMODYNAMIC PROPERTIES *)
	abiabaticIndex = ElementData[myElementEntity, "AdiabaticIndex"] // fixAtomicRadiusValue;
	boilingPoint = ElementData[myElementEntity, "BoilingPoint"] // fixAtomicRadiusValue;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // fixAtomicRadiusValue;
	criticalPressure = ElementData[myElementEntity, "CriticalPressure"] // fixAtomicRadiusValue;
	criticalTemperature = ElementData[myElementEntity, "CriticalTemperature"] // fixAtomicRadiusValue;
	curiePoint = ElementData[myElementEntity, "CuriePoint"] // fixAtomicRadiusValue;
	fusionHeat = ElementData[myElementEntity, "FusionHeat"] // fixAtomicRadiusValue;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // fixAtomicRadiusValue;
	neelPoint = ElementData[myElementEntity, "NeelPoint"] // fixAtomicRadiusValue;
	(* phase = ElementData[myElementEntity, "Phase"] // fixAtomicRadiusValue; *)
	specificHeat = ElementData[myElementEntity, "SpecificHeat"] // fixAtomicRadiusValue;

	newElementObject = {
		"name" -> nameValue,
		"abbreviation" -> abbreviationValue,
		"atomicNumber" -> atomicNumberValue,
		"atomicRadius" -> atomicRadiusValue,
		"covalentRadius" -> covalentRadiusValue,
		"vanDerWaalsRadius" -> vanDerWaalsRadiusValue,
		(* "protonCount" -> protonCountValue *)
		"valence" -> valenceValue,
		"electronegativity" -> electronegativityValue,
		"electronAffinity" -> electronAffinityValue,

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
		"specificHeat" -> specificHeat
	};

	Print@newElementObject;

	periodicTable = Append[periodicTable, newElementObject];
];

deleteExistingFile["tab-properties-data.json"];
Export["tab-properties-data.json", periodicTable, "JSON"];



