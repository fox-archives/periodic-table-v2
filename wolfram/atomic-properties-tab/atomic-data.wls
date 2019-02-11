#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
elementList = EntityList[Entity["Element"]];
Print["atomic-data.wls creating properties"];

For[i = 1, i < 119, i++,
	(* i = elementList[[i]]; *)

	(* COMMON PROPERTIES *)
	(* name = CanonicalName@i; *)
	abbreviation = ElementData[i, "Abbreviation"];
	atomicNumber = ElementData[i, "AtomicNumber"];
	atomicMass = ElementData[i, "AtomicMass"] // catchErrors;

	(* ATOMIC PROPERTIES *)
	atomicRadius = ElementData[i, "AtomicRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	covalentRadius = ElementData[i, "CovalentRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronConfiguration = ElementData[i, "ElectronConfiguration"];
	(* electronShellConfiguration = ElementData[i, "ElectronShellConfiguration"]; *)
	ionizationEnergies = Map[catchErrorsAndNumConvertAndUnitConvert, ElementData[i, "IonizationEnergies"]];

	(* quantumNumbers*)
	vanDerWaalsRadius = ElementData[i, "VanDerWaalsRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronAffinity = ElementData[i, "ElectronAffinity"] // catchErrorsAndNumConvertAndUnitConvert;
	electronegativity = ElementData[i, "Electronegativity"] // catchErrorsAndNumConvertAndUnitConvert;
	(* gasAtomicMultiplicities *)
	valence = ElementData[i, "Valence"] // catchErrorsAndUnitConvert;

	newElementObject = {
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

		"atomicRadius" -> atomicRadius,
		"covalentRadius" -> covalentRadius,
		"electronConfiguration" -> electronConfiguration,
		"electronShellConfiguration" -> electronShellConfiguration,
		"ionizationEnergies" -> ionizationEnergies,
		"vanDerWaalsRadius" -> vanDerWaalsRadius,	
		"electronAffinity" -> electronAffinity,
		"electronegativity" -> electronegativity,
		"valence" -> valence

	};

	Print@newElementObject;Print[" "];

	periodicTable = Append[periodicTable, newElementObject];
];

deleteExistingFile["all-atomic-data.json"];
Export["all-atomic-data.json", periodicTable, "JSON"];



