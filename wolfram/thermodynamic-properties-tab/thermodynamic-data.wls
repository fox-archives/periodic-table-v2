#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

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
	abiabaticIndex = ElementData[myElementEntity, "AdiabaticIndex"] // catchErrorsAndNumConvertAndUnitConvert;
	boilingPoint = ElementData[myElementEntity, "BoilingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	criticalPressure = ElementData[myElementEntity, "CriticalPressure"] // catchErrorsAndNumConvertAndUnitConvert;
	criticalTemperature = ElementData[myElementEntity, "CriticalTemperature"] // catchErrorsAndNumConvertAndUnitConvert;
	curiePoint = ElementData[myElementEntity, "CuriePoint"] // catchErrorsAndNumConvertAndUnitConvert;
	fusionHeat = ElementData[myElementEntity, "FusionHeat"] // catchErrorsAndNumConvertAndUnitConvert;
	meltingPoint = ElementData[myElementEntity, "MeltingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	neelPoint = ElementData[myElementEntity, "NeelPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	(* phase = ElementData[myElementEntity, "Phase"] // catchErrorsAndNumConvertAndUnitConvert; *)
	specificHeat = ElementData[myElementEntity, "SpecificHeat"] // catchErrorsAndNumConvertAndUnitConvert;
	superconductingPoint = ElementData[myElementEntity, "SuperconductingPoint"] // catchErrorsAndNumConvertAndUnitConvert;
	vaporizationHeat = ElementData[myElementEntity, "VaporizationHeat"] // catchErrorsAndNumConvertAndUnitConvert;

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



