#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Sets current directory *)
SetDirectory@DirectoryName@$InputFileName;

(* Import Common Methods *)
Import@FileNameJoin[{ParentDirectory[], "common-methods.wls"}];

periodicTable = {};
 
For[i = 1, i < 119, i++,
	block = ElementData[i, "Block"];
	Switch[
		block,
		"s",
		color = "blue";,
		"p",
		color = "red";,
		"d",
		color = "green";,
		"f",
		color = "orange";
	];
	newElement = {
		"defaultColor" -> color,
		"color" -> color
	};
	
	Print@newElementObject;Print[" "];
	
	periodicTable = Append[periodicTable, newElement];
	
	(* Case for Lanthanites *)
	If[i == 56,
		lanth = {
			"defaultColor" -> "orange",
			"color" -> "orange"
		};
		periodicTable = Append[periodicTable, lanth];
	];
	
	(* Case for Actinides *)
	If[i == 88,
		act = {
			"defaultColor" -> "orange",
			"color" -> "orange"
		};
		periodicTable = Append[periodicTable, act];
	];
];

deleteExistingFile["block.json"];
Export["block.json", periodicTable, "JSON"];