Attribute VB_Name = "RegExpSample"
Option Explicit

' ref. https://www.koikikukan.com/archives/2014/02/12-015555.php

' [参照設定] Microsoft VBScript Regular Expressions 5.5
' ref. https://codezine.jp/article/detail/1655
' ref. https://excelwork.info/excel/vbaregexp/

Public Function searchCCC(rng As Range) As String
    Dim re As RegExp
    Set re = New RegExp
    With re
        .Pattern = "^【(.+)】(.+)_(.+)_(.+)$"
        .IgnoreCase = False
        .Global = True
        Dim reMatch As Object
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
