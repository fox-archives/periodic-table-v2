#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};

formatColumn[value_, i_]:=
	Which[
		(* Give element regular value, if get regular value from ElementData *)
		MissingQ[value] == False,
			Return[value];,
		(* Artifically give element column if it is in the f-block, or an Ant. / Lanth., when get weird values from ElementData *)
		57 <= i && i <= 71,
			Return[i - 54];,
		89 <= i && i <= 103,
			Return[i - 86];,
		True,
			Return["UNEXPECTED"];
	];
	
formatRow[value_, i_]:=
	Which[
	57 <= i && i <= 71,
		Return[9];,
	89 <= i && i <= 103,
		Return[10];,
	True,
		Return[value];
	];
	

For[i = 1, i < 119, i++,
	pColumn = formatColumn[ElementData[i, "Group"], i];
	pRow = formatRow[ElementData[i, "Period"], i];
	
	newElement = {
		(* Show ith element I for debugging *)
		"i" -> i,
		"column" -> pColumn,
		"row" -> pRow
	};
	
	Print@newElementObject;Print[" "];

	periodicTable = Append[periodicTable, newElement];
	
	(* Case for Lanthanites *)
	If[i == 56,
		lanth = {
			"column" -> 3,
			"row" -> 6
		};
		periodicTable = Append[periodicTable, lanth];
	];
	
	(* Case for Actinides *)
	If[i == 88,
		act = {
			"column" -> 3,
			"row" -> 7
		};
		periodicTable = Append[periodicTable, act];
	];
];

deleteExistingFile["placement.json"];
Export["placement.json", periodicTable, "JSON"];