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
Print["Thermodynamic-Data.wls creating properties"];
For[i = 1, i < 119, i++,
	myElementEntity = elementList[[i]];

	name = CanonicalName@myElementEntity;
	abbreviation = ElementData[myElementEntity, "Abbreviation"];
	atomicNumber = ElementData[myElementEntity, "AtomicNumber"];
	atomicMass = ElementData[myElementEntity, "AtomicMass"];

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

	newElementObject = {
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

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

deleteExistingFile["thermodynamic-data.json"];
Export["thermodynamic-data.json", periodicTable, "JSON"];



