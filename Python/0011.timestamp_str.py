import datetime

# https://maku77.github.io/python/datetime/date-string.html
# https://python.civic-apps.com/date-format/
# https://www.delftstack.com/ja/howto/python/python-datetime-milliseconds/
# https://docs.python.org/ja/3/library/time.html#time.strftime
now = datetime.datetime.now()
print(now.strftime("%Y-%m-%d %H:%M:%S.%f"))
print(now.strftime("%Y-%m-%d %H:%M:%S.%f")[:-3])

# https://stackoverflow.com/questions/7588511/format-a-datetime-into-a-string-with-milliseconds
from datetime import datetime
print(datetime.utcnow().isoformat(sep=" ", timespec="milliseconds"))
