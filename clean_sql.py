import re

def extract_schema_from_sql(sql_text):
    # إزالة التعليقات
    sql_text = re.sub(r'/\*.*?\*/', '', sql_text, flags=re.DOTALL)  # multi-line comments
    sql_text = re.sub(r'--.*', '', sql_text)  # single-line comments

    # تطبيع النص
    sql_text = sql_text.replace('\n', ' ')  # اجعل كل شيء في سطر واحد لتسهيل الـ regex

    # استخراج الجداول باستخدام regex أكثر مرونة
    pattern = re.compile(
        r'CREATE\s+TABLE\s+(IF\s+NOT\s+EXISTS\s+)?`?(\w+)`?\s*\((.*?)\)\s*(ENGINE|COMMENT|;)',
        re.IGNORECASE | re.DOTALL
    )

    matches = pattern.findall(sql_text)

    output = []
    for _, table_name, columns_block, _ in matches:
        columns = []
        for col in columns_block.split(','):
            col = col.strip()
            # تجاهل المفاتيح (PRIMARY, KEY, etc.)
            if re.match(r'^(PRIMARY|UNIQUE|KEY|FOREIGN)', col, re.IGNORECASE):
                continue
            match = re.match(r'`?(\w+)`?\s+', col)
            if match:
                columns.append(match.group(1))

        if columns:
            output.append(f"Table: {table_name} ({', '.join(columns)})")

    return output


def main():
    input_file = "./hurryapp.sql"
    output_file = "./schema_for_gemini.txt"

    with open(input_file, 'r', encoding='utf-8') as f:
        sql_text = f.read()

    schema = extract_schema_from_sql(sql_text)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(schema))

    print(f"✅ Schema saved to: {output_file} ({len(schema)} tables extracted)")


if __name__ == "__main__":
    main()
