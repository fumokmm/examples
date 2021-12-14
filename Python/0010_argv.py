import sys

print(f"ファイル名：{sys.argv[0]}")
if len(sys.argv) > 1:
    print(f"引数1：{sys.argv[1]}")
if len(sys.argv) > 2:
    print(f"引数2：{sys.argv[2]}")
if len(sys.argv) > 3:
    print(f"引数3：{sys.argv[3]}")
