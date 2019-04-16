#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
Print["atomic-data.wls creating properties"];

For[i = 1, i < 119, i++,
	(* COMMON PROPERTIES *)
	name = ElementData[i, "Name"] // Capitalize;
	abbreviation = ElementData[i, "Abbreviation"];
	atomicNumber = ElementData[i, "AtomicNumber"];
	atomicMass = ElementData[i, "AtomicMass"] // catchErrors;

	(* ATOMIC PROPERTIES *)
	atomicRadius = ElementData[i, "AtomicRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	covalentRadius = ElementData[i, "CovalentRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronConfiguration = ElementData[i, "ElectronConfiguration"];
	(* ElectronConfigurationString *)
	electronShellConfiguration = ElementData[i, "ElectronShellConfiguration"];
	ionizationEnergies = Map[catchErrorsAndNumConvertAndUnitConvert, ElementData[i, "IonizationEnergies"]];
	(* QuantumNumbers *)
	vanDerWaalsRadius = ElementData[i, "VanDerWaalsRadius"] // catchErrorsAndNumConvertAndUnitConvert;
	electronAffinity = ElementData[i, "ElectronAffinity"] // catchErrorsAndNumConvertAndUnitConvert;
	electronegativity = ElementData[i, "Electronegativity"] // catchErrorsAndNumConvertAndUnitConvert;
	(* GasAtomicMultiplicities *)
	valence = ElementData[i, "Valence"] // catchErrorsAndUnitConvert;

	newElementObject = {
		(* COMMON PROPERTIES *)
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

		(* ATOMIC PROPERTIES *)
		"atomicRadius" -> atomicRadius,
		"covalentRadius" -> covalentRadius,
		"electronConfiguration" -> electronConfiguration,
		(* ElectronConfigurationString *)
		"electronShellConfiguration" -> electronShellConfiguration,
		"ionizationEnergies" -> ionizationEnergies,
		(* QuantumNumbers *)
		"vanDerWaalsRadius" -> vanDerWaalsRadius,	
		"electronAffinity" -> electronAffinity,
		"electronegativity" -> electronegativity,
		(* GasAtomicMultiplicities *)
		"valence" -> valence

	};

	Print@newElementObject;Print[" "];

	periodicTable = Append[periodicTable, newElementObject];

	(* Case for Lanthanites *)
	If[i == 56,
		lanth = {
			"name" -> "Lanth.",
			"abbreviation" -> "",
			"atomicNumber" -> "",
			"atomicMass" -> ""
		};
		periodicTable = Append[periodicTable, lanth];
	];
	
	(* Case for Actinides *)
	If[i == 88,
		act = {
			"name" -> "Act.",
			"abbreviation" -> "",
			"atomicNumber" -> "",
			"atomicMass" -> ""
		};
		periodicTable = Append[periodicTable, act];
	];
];

deleteExistingFile["atomic-data.json"];
Export["atomic-data.json", periodicTable, "JSON"];



