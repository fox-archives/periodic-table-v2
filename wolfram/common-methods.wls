#!/usr/bin/env wolframscript
(* ::Package:: *)

Print["Import common-methods.wls"];

deleteExistingFile[myFile_]:= (
	Print["Deleting"];
	If[
		FileExistsQ[myFile],
		DeleteFile[myFile]
	];
)

(* printElement[element_]:= (
	(* Print@element; *)
	list = Keys[element];
	(* Print@list; *)
	For[i = 1, i < Length[list], i++,
		extraSpace = "";
		If[i != 1,
			extraSpace = "   ";,
			extraSpace = "";
		];
		Print[extraSpace <> list[[i]] <> " -> "];
	];
) *)