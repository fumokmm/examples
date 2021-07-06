# ref. https://www.tohoho-web.com/ruby/types.html

# 整数(Integer)
# 10進数、16進数、8進数、2進数
num1 = 0d9999      # 10進数 (0dで始まる数値は10進数とみなされる)
num2 = 0xffff      # 16進数 (0xで始まる数値は16進数とみなされる)
num3 = 0o777       # 8進数 (0oで始まる数値は 8進数とみなされる)
num4 = 0b11000100  # 2進数 (0bで始まる数値は 2進数とみなされる)

puts num1
puts num2
puts num3
puts num4

# --------------------------------- output
# $ ruby 0004_types_integer2.rb 
# 9999
# 65535
# 511
# 196
