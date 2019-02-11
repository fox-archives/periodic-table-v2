#!/usr/bin/env wolframscript
(* ::Package:: *)

Print["Import common-methods.wls"];

deleteExistingFile[myFile_]:= (
	Print["Deleting existing json file"];
	If[
		FileExistsQ[myFile],
		DeleteFile[myFile]
	];
)

catchErrorsAndNumConvertAndUnitConvert[data_]:= (
	If[FailureQ[data],
		Return["Failed"];
	];
	If[MissingQ[data],
		Return["Unknown"];,
		Return[UnitConvert@N@QuantityMagnitude[data]];
	];
)

catchErrorsAndUnitConvert[data_]:= (
	If[FailureQ[data],
		Return["Failed"];
	];
	If[MissingQ[data],
		Return["Unknown"];,
		Return[UnitConvert@QuantityMagnitude[data]];
	];
)

catchErrors[data_]:= (
	If[FailureQ[data],
		Return["Failed"];
	];
	If[MissingQ[data],
		Return["Unknown"];,
		Return[QuantityMagnitude[data]];
	];
)

(* toHTMLSuperScript[i_, fn_]:= (
	(* Unprotects Mathematica's Superscript method, so it can be overriden *)
	Unprotect[Superscript];
	Superscript[x_, y_] := Return[StringJoin[ToString[x], "<sup>", ToString[y], "</sup>", " "]];
	Subscript[x_, y_] := Return[StringJoin[ToString[x], "<sub>", ToString[y], "</sub>", " "]];

	newProp = ToString@ElementData[i, fn];
	(* Restores Mathematica's Superscript method *)
	Superscript[x_, y_]=.;
	Subscript[x_, y_]=.;

	newProp = StringReplace[newProp, "]" -> "] ", 1];
	Return[newProp];
) *)