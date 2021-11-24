# 半角数値
s1 = "1234567890"
assert s1.isdecimal() == True
assert s1.isdigit() == True
assert s1.isnumeric() == True

# 全角文字
s2 = "１２３４５６７８９０"
assert s2.isdecimal() == True
assert s2.isdigit() == True
assert s2.isnumeric() == True

# 2乗を表す上付き数字²
pow2 = "²"
assert pow2.isdecimal() == False # decimalではFalse
assert pow2.isdigit() == True
assert pow2.isnumeric() == True

# 分数
fraction = "½"
assert fraction.isdecimal() == False
assert fraction.isdigit() == False
assert fraction.isnumeric() == True

# ローマ数字
roman = "Ⅶ"
assert roman.isdecimal() == False
assert roman.isdigit() == False
assert roman.isnumeric() == True

# 漢数字
kanji1 = "一二三四五六七八九〇"
kanji2 = "壱億参阡萬"
assert kanji1.isdecimal() == False
assert kanji1.isdigit() == False
assert kanji1.isnumeric() == True
assert kanji2.isdecimal() == False
assert kanji2.isdigit() == False
assert kanji2.isnumeric() == True
