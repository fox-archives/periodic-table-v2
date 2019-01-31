#!/usr/bin/env wolframscript
(* ::Package:: *)

Print["Import common-methods.wls"];

deleteExistingFile[myFile_]:=
(
	Print["Deleting"];
	If[
		FileExistsQ[myFile],
		DeleteFile[myFile]
	];
)