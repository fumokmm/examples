Attribute VB_Name = "VBA_Interface"
Option Explicit

Public Sub Main()
    Dim p_taro As clsHuman
    Set p_taro = New clsMan
    With p_taro
        .Name = "‘¾˜Y"
        .Age = 40
    End With
    printInfo p_taro
    
    Dim p_hanako As clsHuman
    Set p_hanako = New clsWoman
    With p_hanako
        .Name = "‰ÔŽq"
        .Age = 18
    End With
    printInfo p_hanako
End Sub

Private Sub printInfo(x_human As clsHuman)
    x_human.Greet
    Debug.Print x_human.GetInfo()
End Sub
