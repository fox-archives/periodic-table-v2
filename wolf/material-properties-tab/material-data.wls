#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
Print["material-data.wls creating properties"];

For[i = 1, i < 119, i++,
	(* COMMON PROPERTIES *)
	name = ElementData[i, "Name"] // Capitalize;
	abbreviation = ElementData[i, "Abbreviation"];
	atomicNumber = ElementData[i, "AtomicNumber"];
	atomicMass = ElementData[i, "AtomicMass"] // catchErrors;

	(* MATERIAL PROPERTIES *)
	brinellHardness = ElementData[i, "BrinellHardness"] // catchErrorsAndNumConvertAndUnitConvert;
	bulkModulus = ElementData[i, "BulkModulus"] // catchErrorsAndNumConvertAndUnitConvert;
	density = ElementData[i, "Density"] // catchErrorsAndNumConvertAndUnitConvert;
	liquidDensity = ElementData[i, "LiquidDensity"] // catchErrorsAndNumConvertAndUnitConvert;
	mohsHardness = ElementData[i, "MohsHardness"] // catchErrorsAndNumConvertAndUnitConvert;
	molarVolume = ElementData[i, "MolarVolume"] // catchErrorsAndNumConvertAndUnitConvert;
	(* poissonRatio = ElementData[i "PoissonRatio"] // catchErrors; *)
	shearModulus = ElementData[i, "ShearModulus"] // catchErrorsAndNumConvertAndUnitConvert;
	soundSpeed = ElementData[i, "SoundSpeed"] // catchErrorsAndNumConvertAndUnitConvert;
	thermalConductivity = ElementData[i, "ThermalConductivity"] // catchErrorsAndNumConvertAndUnitConvert;
	thermalExpansion = ElementData[i, "ThermalExpasion"] // catchErrorsAndNumConvertAndUnitConvert;
	vickersHardness = ElementData[i, "VickersHardness"] // catchErrorsAndNumConvertAndUnitConvert;
	youngModulus = ElementData[i, "YoungModulus"] // catchErrorsAndNumConvertAndUnitConvert;

	newElementObject = {
		(* COMMON PROPERTIES *)
		"name" -> name,
		"abbreviation" -> abbreviation,
		"atomicNumber" -> atomicNumber,
		"atomicMass" -> atomicMass,

		(* MATERIAL PROPERTIES *)
		"brinellHardness" -> brinellHardness,
		"bulkModulus" -> bulkModulus,
		"density" -> density,
		"liquidDensity" -> liquidDensity,
		"mohsHardness" -> mohsHardness,
		"molarVolume" -> molarVolume,
		(* "poissonRatio" -> poissonRatio, *)
		"shearModulus" -> shearModulus,
		"soundSpeed" -> soundSpeed,
		"thermalConductivity" -> thermalConductivity,
		"thermalExpansion" -> thermalExpansion,
		"vickersHardness" -> vickersHardness,
		"youngModulus" -> youngModulus
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

deleteExistingFile["material-data.json"];
Export["material-data.json", periodicTable, "JSON"];



