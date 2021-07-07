Attribute VB_Name = "RegExpSample"
Option Explicit

' ref. https://www.koikikukan.com/archives/2014/02/12-015555.php

Public Function searchCCC(rng As Range) As String
    Dim re, reMatch As Object
    Set re = CreateObject("VBScript.RegExp")
    With re
        .Pattern = "^【(.+)】(.+)_(.+)_(.+)$"
        .IgnoreCase = False
        .Global = True
        Set reMatch = .Execute(rng)
        If reMatch.Count > 0 Then
            If reMatch(0).SubMatches.Count > 0 Then
                searchCCC = reMatch(0).SubMatches(2)
                Exit Function
            End If
        End If
    End With
    searchCCC = "Not Found."
End Function
