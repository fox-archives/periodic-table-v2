#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
Print["all-properties-data.wls creating properties"];

For[i = 1, i < 119, i++,
	(* COMMON PROPERTIES *)
	name = ElementData[i, "Name"] // Capitalize;
	abbreviation = ElementData[i, "Abbreviation"];
	atomicNumber = ElementData[i, "AtomicNumber"];
	atomicMass = ElementData[i, "AtomicMass"] // catchErrorsAndNumConvertAndUnitConvert;

	(* ATOMIC PROPERTIES *)
	atomicRadius = ElementData[i, "AtomicRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	covalentRadius = ElementData[i, "CovalentRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	inizationEnergies = ElementData[i, "IonizationEnergies"] // catchErrorsAndNumConvertAndUnitConvert;
	vanDerWaalsRadius = ElementData[i, "VanDerWaalsRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	neuronCount = "";
	electronCount = "";
	valence = ElementData[i, "Valence"] // catchErrorsAndUnitConvert;
	electronegativity = ElementData[i, "Electronegativity"] // catchErrorsAndNumConvertAndUnitConvert;
	electronAffinity = ElementData[i, "ElectronAffinity"] // catchErrorsAndNumConvertAndUnitConvert;


	(* THERMODYNAMIC PROPERTIES *)
	abiabaticIndex = ElementData[i, "AdiabaticIndex"] // catchErrorsAndNumConvertAndUnitConvert;
	boilingPoint = ElementData[i, "BoilingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	meltingPoint = ElementData[i, "MeltingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
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
	(* Skipping Some *)

	newElementObject = {
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

    (* ATOMIC PROPERTIES *)
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

deleteExistingFile["all-properties-data.json"];
Export["all-properties-data.json", periodicTable, "JSON"];



