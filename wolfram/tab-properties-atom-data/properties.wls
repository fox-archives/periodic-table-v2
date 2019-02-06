#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods-old.wls"}];
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

fixBoilingPoint[x_]:= (
	If[MissingQ[x],
		Return["Unknown"];,
		Return[UnitConvert@N@QuantityMagnitude[x]];
	];
)


periodicTable = {};

elementList = EntityList[Entity["Element"]];
For[i = 1, i < 119, i++,
	myElementEntity = elementList[[i]];

	nameValue = CanonicalName@myElementEntity;
	abbreviationValue = EntityValue[myElementEntity, "Abbreviation"];
	atomicNumberValue = EntityValue[myElementEntity, "AtomicNumber"];
	atomicWeightValue = EntityValue[myElementEntity, "AtomicMass"] // QuantityMagnitude;
	boilingPointValue = EntityValue[myElementEntity, "BoilingPoint"] // fixBoilingPoint;

	newElementObject = {
		"name" -> nameValue,
		"abbreviation" -> abbreviationValue,
		"atomicNumber" -> atomicNumberValue,
		"atomicWeight" -> atomicWeightValue,
		"boilingPoint" -> boilingPointValue
	};

	Print@newElementObject;

	periodicTable = Append[periodicTable, newElementObject];
];

deleteExistingFile["tab-properties-data.json"];
Export["tab-properties-data.json", periodicTable, "JSON"];



