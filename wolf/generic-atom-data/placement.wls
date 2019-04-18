#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};

getColumn[value_, i_]:= (
	Which[
		(* Give element regular value, if get regular value from ElementData *)
		MissingQ[value] == False,
			Return[value];,
		(* Artifically give element column if it is in the f-block, or an Ant. / Lanth., since they do not have a corresponding group / column *)
		57 <= i && i <= 71,
			Return[i - 54];,
		89 <= i && i <= 103,
			Return[i - 86];,
		True,
			Return["UNEXPECTED"];
	];
)
	
getRow[value_, i_]:= (
	Which[
	57 <= i && i <= 71,
		Return[9];,
	89 <= i && i <= 103,
		Return[10];,
	True,
		Return[value];
	];
)

getGroup[value_, i_]:= (
	Which[
		MissingQ[value] == False,
			Return[value];,
		True,
			Return["NOGROUP"]
	];
)
	

For[i = 1, i < 119, i++,
	(* pColumn and pRow represent positions in the grid (not adjusted for the existance of labels on the main grid) *)
	pColumn = getColumn[ElementData[i, "Group"], i];
	pRow = getRow[ElementData[i, "Period"], i];

	(* Actual Group or Period the element is categorized in *)
	pGroup = getGroup[ElementData[i, "Group"], i];
	pPeriod = ElementData[i, "Period"];

	newElement = {
		(* Show ith element I for debugging *)
		"i" -> i,
		"column" -> pColumn,
		"row" -> pRow,
		"group" -> pGroup,
		"period" -> pPeriod
	};
	
	Print@newElement;Print[" "];

	periodicTable = Append[periodicTable, newElement];
	
	(* Case for Lanthanites *)
	If[i == 56,
		lanth = {
			"column" -> 3,
			"row" -> 6,
			
			"group" -> 3,
			"period" -> 6
		};
		periodicTable = Append[periodicTable, lanth];
	];
	
	(* Case for Actinides *)
	If[i == 88,
		act = {
			"column" -> 3,
			"row" -> 7,

			"group" -> 3,
			"period" -> 7
		};
		periodicTable = Append[periodicTable, act];
	];
];

deleteExistingFile["placement.json"];
Export["placement.json", periodicTable, "JSON"];