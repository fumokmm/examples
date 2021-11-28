# 長さチェックには len関数を使う
list = ["A", "B", "C", "D", "E"]
assert len(list) == 5

# リストに要素が含まれているかのチェックには in を使う
list = ["A", "B", "C", "D", "E"]
assert ("C" in list) == True

###################################################
# ソート
#####
# 元のリストのソート（破壊的）
list = [3, 10, 2, 1, 5]
list.sort()
assert list == [1, 2, 3, 5, 10]
# 逆順
list.sort(reverse=True)
assert list == [10, 5, 3, 2, 1]
# キーを指定してソート
list = ["BB", "CCC", "A"]
list.sort(key=lambda x: -len(x)) # 文字数が多い順
assert list == ["CCC", "BB", "A"]

#####
# ソートされた新しいリストを返却
list = [3, 10, 2, 1, 5]
list2 = sorted(list)
assert list2 == [1, 2, 3, 5, 10]
assert list == [3, 10, 2, 1, 5] # 元のリストは変化なし
# 逆順
list3 = sorted(list, reverse=True)
assert list3 == [10, 5, 3, 2, 1]
assert list == [3, 10, 2, 1, 5] # 元のリストは変化なし
# キーを指定してソート
list = ["BB", "CCC", "A"]
list4 = sorted(list, key=lambda x: -len(x)) # 文字数が多い順
assert list4 == ["CCC", "BB", "A"]
assert list == ["BB", "CCC", "A"] # 元のリストは変化なし
