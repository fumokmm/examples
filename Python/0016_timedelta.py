import datetime

now = datetime.datetime.now()
print(type(now))  # => <class 'datetime.datetime'>
print(now)        # => 2022-02-08 21:46:45.976739

delta = datetime.timedelta(days=1)
print(type(delta))  # => <class 'datetime.timedelta'>
print(delta)        # => 1 day, 0:00:00

tomorrow = now + delta
print(type(tomorrow))  # => <class 'datetime.datetime'>
print(tomorrow)        # => 2022-02-09 21:46:45.976739

yesterday = now - delta
print(type(yesterday))  # => <class 'datetime.datetime'>
print(yesterday)        # => 2022-02-07 21:46:45.976739


### 出力結果
# <class 'datetime.datetime'>
# 2022-02-08 21:46:45.976739
# <class 'datetime.timedelta'>
# 1 day, 0:00:00
# <class 'datetime.datetime'>
# 2022-02-09 21:46:45.976739
# <class 'datetime.datetime'>
# 2022-02-07 21:46:45.976739
