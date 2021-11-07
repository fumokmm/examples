import pandas as pd

ser = pd.Series(["晴れ", "雨", "くもり","晴れ時々くもり", "雨"])
print(ser)
# <output>
# 0         晴れ
# 1          雨
# 2        くもり
# 3    晴れ時々くもり
# 4          雨

# 完全一致のフィルタ
print(ser == "雨")
# <output>
# 0    False
# 1     True
# 2    False
# 3    False
# 4     True
# dtype: bool

# => 各行で指定の条件に位置する部分だけTrueとなるSeriesが返却されるので、
#    これをSeriesに渡すことで行の絞り込みができる

print(ser[ser == "雨"])
# <output>
# 1    雨
# 4    雨
# dtype: object

# boolのArrayであれば良いので、以下のようなリスト内包表記でも同じ結果が得られる
print(ser[[x == "雨" for x in ser]])


# 含まれる文字列
print(ser[ser.str.contains("晴れ")])
# <output>
# 0         晴れ
# 3    晴れ時々くもり
# dtype: object

# 指定文字で終わる
print(ser[ser.str.endswith("くもり")])
# <output>
# 2        くもり
# 3    晴れ時々くもり
# dtype: object

# 指定文字で始まる
print(ser[ser.str.startswith("晴れ")])
# <output>
# 0         晴れ
# 3    晴れ時々くもり
# dtype: object
