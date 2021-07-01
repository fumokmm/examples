VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "clsMan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Implements clsHuman ' clsHumanを実装

' フィールド
Private f_name As String
Private f_age As Integer

' プロパティ: Nameの実装
Public Property Let clsHuman_Name(ByVal x_name As String)
    f_name = x_name
End Property

' プロパティ: Nameの実装
Public Property Get clsHuman_Name() As String
    clsHuman_Name = f_name
End Property

' プロパティ: Ageの実装
Public Property Let clsHuman_Age(ByVal x_age As Integer)
    f_age = x_age
End Property

' プロパティ: Ageの実装
Public Property Get clsHuman_Age() As Integer
    clsHuman_Age = f_age
End Property

' サブプロシージャ: Greetの実装
Public Sub clsHuman_Greet()
    Debug.Print "やぁ！僕の名前は " & f_name & " だよ。"
End Sub

' ファンクション: GetInfoの実装
Public Function clsHuman_GetInfo() As String
    clsHuman_GetInfo = "{""man"": {""name"":""" & f_name & """, ""age"":""" & CStr(f_age) & """}}"
End Function
