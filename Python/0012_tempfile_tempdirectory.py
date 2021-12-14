# https://qiita.com/everylittle/items/aa7c6f612ff0a9db7f01


# 一時ファイル
print("--- tempfile ---")
import tempfile
with tempfile.TemporaryFile("w+") as f:
    print(f.name)
    print("Test", file=f)
    f.seek(0)
    assert f.read() == "Test\n"

# 一時ディレクトリ (v3.2以降)
print("--- temp_directory ---")
import tempfile
import os
with tempfile.TemporaryDirectory() as tmpdir:
    print(tmpdir)
    assert os.path.exists(tmpdir) # True
    with open(os.path.join(tmpdir, "test.txt"), "w") as f:
        print("test", file=f)

assert os.path.exists(tmpdir) == False
