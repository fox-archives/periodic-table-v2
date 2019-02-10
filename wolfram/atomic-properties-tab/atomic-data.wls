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
	myElementEntity = elementList[[i]];

	(* COMMON PROPERTIES *)
	name = CanonicalName@myElementEntity;
	abbreviation = ElementData[myElementEntity, "Abbreviation"];
	atomicNumber = ElementData[myElementEntity, "AtomicNumber"];
	atomicMass = ElementData[myElementEntity, "AtomicMass"] // catchErrors;

	(* ATOMIC PROPERTIES *)
	atomicRadius = ElementData[myElementEntity, "AtomicRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	covalentRadius = ElementData[myElementEntity, "CovalentRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronConfiguration = ElementData[myElementEntity, "ElectronConfiguration"];
	ionizationEnergies = Map[catchErrorsAndNumConvertAndUnitConvert, ElementData[myElementEntity, "IonizationEnergies"]];

	(* quantumNumbers*)
	vanDerWaalsRadius = ElementData[myElementEntity, "VanDerWaalsRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronAffinity = ElementData[myElementEntity, "ElectronAffinity"] // catchErrorsAndNumConvertAndUnitConvert;
	electronegativity = ElementData[myElementEntity, "Electronegativity"] // catchErrorsAndNumConvertAndUnitConvert;
	(* gasAtomicMultiplicities *)
	valence = ElementData[myElementEntity, "Valence"] // catchErrorsAndUnitConvert;

	newElementObject = {
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

		"atomicRadius" -> atomicRadius,
		"covalentRadius" -> covalentRadius,
		"electronConfiguration" -> electronConfiguration,
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



