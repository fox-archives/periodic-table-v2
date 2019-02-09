#!/usr/bin/env wolframscript
(* ::Package:: *)

Print["Import common-methods-old.wls"];

toHTMLSuperScript[i_, fn_]:=
	If["true" === "true",
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
	];