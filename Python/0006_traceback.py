import traceback

try:
    num = 1 / 0

except Exception as e:
    # 文字列を取得する
    print("エラー情報\n" + traceback.format_exc())
