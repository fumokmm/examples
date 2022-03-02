f = File.open("data/aaa.txt")
lines = f.readlines
p lines # => ["aaa\n", "bbb\n", "ccc"]
f.close
