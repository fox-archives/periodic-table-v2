#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
Print["thermodynamic-data.wls creating properties"];

For[i = 1, i < 119, i++,
	(* COMMON PROPERTIES *)
	name = ElementData[i, "Name"] // Capitalize;
	abbreviation = ElementData[i, "Abbreviation"];
	atomicNumber = ElementData[i, "AtomicNumber"];
	atomicMass = ElementData[i, "AtomicMass"] // catchErrors;

	(* THERMODYNAMIC PROPERTIES *)
	abiabaticIndex = ElementData[i, "AdiabaticIndex"] // catchErrorsAndNumConvertAndUnitConvert;
	boilingPoint = ElementData[i, "BoilingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	criticalPressure = ElementData[i, "CriticalPressure"] // catchErrorsAndNumConvertAndUnitConvert;
	criticalTemperature = ElementData[i, "CriticalTemperature"] // catchErrorsAndNumConvertAndUnitConvert;
	curiePoint = ElementData[i, "CuriePoint"] // catchErrorsAndNumConvertAndUnitConvert;
	fusionHeat = ElementData[i, "FusionHeat"] // catchErrorsAndNumConvertAndUnitConvert;
	meltingPoint = ElementData[i, "MeltingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	neelPoint = ElementData[i, "NeelPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	(* phase = ElementData[i, "Phase"] // catchErrorsAndNumConvertAndUnitConvert; *)
	specificHeat = ElementData[i, "SpecificHeat"] // catchErrorsAndNumConvertAndUnitConvert;
	superconductingPoint = ElementData[i, "SuperconductingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	vaporizationHeat = ElementData[i, "VaporizationHeat"] // catchErrorsAndNumConvertAndUnitConvert;

	newElementObject = {
		(* COMMON PROPERTIES *)
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

		(* THERMODYNAMIC PROPERTIES *)
		"abiabaticIndex" -> abiabaticIndex,
		"boilingPoint" -> boilingPoint,
		"criticalPressure" -> criticalPressure,
		"criticalTemperature" -> criticalTemperature,
		"curiePoint" -> curiePoint,
		"fusionHeat" -> fusionHeat,
		"meltingPoint" -> meltingPoint,
		"neelPoint" -> neelPoint,
		(* "phase" -> phase, *)
		"specificHeat" -> specificHeat,
		"superconductingPoint" -> superconductingPoint,
		"vaporizationHeat" -> vaporizationHeat
	};

	Print@newElementObject;Print[" "];

	periodicTable = Append[periodicTable, newElementObject];

	(* Case for Lanthanites *)
	If[i == 56,
		lanth = {
			"name" -> "Lanthanides",
			"abbreviation" -> "Lan.",
			"atomicNumber" -> "57-71",
			"atomicMass" -> ""
		};
		periodicTable = Append[periodicTable, lanth];
	];
	
	(* Case for Actinides *)
	If[i == 88,
		act = {
			"name" -> "Actinides",
			"abbreviation" -> "Act.",
			"atomicNumber" -> "89-103",
			"atomicMass" -> ""
		};
		periodicTable = Append[periodicTable, act];
	];
];

deleteExistingFile["thermodynamic-data.json"];
Export["thermodynamic-data.json", periodicTable, "JSON"];



