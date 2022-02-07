###########################################
# デフォルトは、MM/DD/YY hh:mm:ss
# デフォルトは %x %X というお手軽フォーマットが利用できる
import datetime

now = datetime.datetime.now()
print(type(now))               # => <class 'datetime.datetime'>
print(now.strftime("%x %X"))   # => 02/07/22 20:23:28

d = now.date()
print(type(d))                 # => <class 'datetime.date'>
print(d.strftime("%x %X"))     # => 02/07/22 00:00:00
# dateクラスだと時刻は00:00:00になるみたい

t = now.time()
print(type(t))                 # => <class 'datetime.time'>
print(t.strftime("%x %X"))     # => 01/01/00 20:23:28
# timeクラスだと日付が01/01/00になるみたい

print(f"{now:%x %X}")          # => 02/07/22 20:23:28
print(format(now, "%x %X"))    # => 02/07/22 20:23:28
print("{:%x %X}".format(now))  # => 02/07/22 20:23:28

# デフォルト以外を使いたい場合はフルで指定していく
# 日本でよく使うのは YYYY/MM/DD hh:mm:ssなので、
# now.strftime("%Y/%m/%d %H:%M:%S") とするとよい。
print(now.strftime("%Y/%m/%d %H:%M:%S"))  # => 2022/02/07 20:23:28


# timeモジュールのstrftime関数を使う場合は、語順が逆になるみたい
import time

nowt = time.localtime()
print(type(nowt))  # => <class 'time.struct_time'>
print(time.strftime("%x %X", nowt))  # => 02/07/22 20:23:28
