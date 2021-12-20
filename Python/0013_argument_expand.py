# リストを展開
# リストの展開には * を使う
def func_list(arg1, arg2, arg3):
    print("arg1 =" + str(arg1))
    print("arg2 =" + str(arg2))
    print("arg3 =" + str(arg3))

lst = [10, "aaa", True]
func_list(*lst)

# リストの数が引数の数より多かったり少なかったりすると
# TypeErrorが発生します。

# 辞書を展開
# 辞書の展開には ** を使う
def func_dict(key1, key2, key3):
    print("key1 =" + str(key1))
    print("key2 =" + str(key2))
    print("key3 =" + str(key3))

dic = {"key3": 10, "key2": "aaa", "key1": True}
func_dict(**dic)

# 引数名と一致するキーが無かったり、一致しないキーがあったりすると
# TypeErrorになります。


########### output
# arg1 =10
# arg2 =aaa
# arg3 =True
# key1 =True
# key2 =aaa
# key3 =10
