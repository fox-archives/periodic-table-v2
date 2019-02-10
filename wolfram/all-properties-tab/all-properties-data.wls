#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

toHTMLSuperScript[i_, fn_]:= (
	(* Unprotects Mathematica's Superscript method, so it can be overriden *)
	Unprotect[Superscript];
	Superscript[x_, y_] := Return[StringJoin[ToString[x], "<sup>", ToString[y], "</sup>", " "]];
	Subscript[x_, y_] := Return[StringJoin[ToString[x], "<sub>", ToString[y], "</sub>", " "]];

	newProp = ToString@ElementData[i, fn];
	(* Restores Mathematica's Superscript method *)
	Superscript[x_, y_]=.;
	Subscript[x_, y_]=.;

	newProp = StringReplace[newProp, "]" -> "] ", 1];
	Return[newProp];
)

periodicTable = {};

(* elementList = EntityList[Entity["Element"]]; *)
Print["all-properties-data.wls creating properties"];
For[i = 1, i < 119, i++,
	(* i = elementList[[i]]; *)

	(* COMMON PROPERTIES *)
	name = ElementData[i, "Name"];
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

	Print@newElementObject;Print[" "];

	periodicTable = Append[periodicTable, newElementObject];
];

deleteExistingFile["all-properties-data.json"];
Export["all-properties-data.json", periodicTable, "JSON"];



