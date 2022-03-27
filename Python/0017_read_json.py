import json

# JSON文字列
s = f"""{{
    "a": "100",
    "b": {{
        "c": "def"
    }}
}}
"""
# JSON文字列 → JSONデータへ
json_data = json.loads(s)
print(json_data)
print(type(json_data))
