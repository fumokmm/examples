# PS C:\Users\fumo> Set-PSDebug -strict
# PS C:\Users\fumo> $newValue
# 変数 '$newValue' は、設定されていないために取得できません。
# 発生場所 行:1 文字:1
# + $newValue
# + ~~~~~~~~~
#     + CategoryInfo          : InvalidOperation: (newValue:String) []、RuntimeException
#     + FullyQualifiedErrorId : VariableIsUndefined
# 
# PS C:\Users\fumo> Set-PSDebug -Off
# PS C:\Users\fumo> $newValue
# PS C:\Users\fumo>