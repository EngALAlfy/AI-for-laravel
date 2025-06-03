import requests
import json
import os

API_KEY = os.getenv('GEMINI_API_KEY')
if not API_KEY:
    raise ValueError("Please set the GEMINI_API_KEY environment variable")

API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={API_KEY}"

# إعداد config للتوليد تشمل SQL و HTML
generation_config = {
    "temperature": 0.2,
    "topP": 0.8,
    "topK": 40,
    "maxOutputTokens": 1024,
    "candidateCount": 1,
    "responseMimeType": "application/json",
    "responseSchema": {
        "type": "OBJECT",
        "properties": {
            "sql": { "type": "STRING" },
            "html": { "type": "STRING" }
        },
        "required": ["sql", "html"]
    }
}

# تحميل مخطط قاعدة البيانات (schema)
def read_schema():
    schema_file = os.path.join(os.path.dirname(__file__), 'schema_for_gemini.txt')
    try:
        with open(schema_file, 'r') as f:
            return f.read().strip()
    except FileNotFoundError:
        raise FileNotFoundError(f"Schema file not found: {schema_file}")

# أخذ مدخل المستخدم
user_question = input("❓ Write your report description in English: ").strip()

# إعداد الـ prompt
prompt_text = (
    "You are a MySQL SQL and Laravel Blade HTML assistant.\n"
    "First, generate a SAFE and valid SELECT SQL query that answers the question.\n"
    "Then, generate a clean Laravel Blade HTML table (Bootstrap-styled) that displays the expected result of this SQL query.\n"
    "The Blade code must use @foreach, and include headers and values.\n"
    "The SQL must not contain any DELETE, UPDATE, INSERT, DROP, or unsafe operations.\n"
    "Return your answer as a JSON object with two fields: 'sql' and 'html'.\n\n"
    f"Database schema:\n{read_schema()}\n\n"
    f"Question: {user_question}\n"
)

# بناء البيانات
data = {
    "contents": [
        {
            "parts": [{"text": prompt_text}]
        }
    ],
    "generationConfig": generation_config
}

# إرسال الطلب
response = requests.post(
    API_URL,
    headers={"Content-Type": "application/json"},
    data=json.dumps(data)
)

# التحقق من الرد
if response.status_code == 200:
    result = response.json()
    try:
        generated_text = result['candidates'][0]['content']['parts'][0]['text']
        output = json.loads(generated_text)
        sql_query = output.get("sql", "").strip().lower()
        html_code = output.get("html", "").strip()

        # تحقق من سلامة الـ SQL
        if sql_query.startswith("select") and not any(keyword in sql_query for keyword in ["delete", "update", "insert", "drop", "alter", "--", "/*", "*/"]):
            print("✅ SQL Query:")
            print(sql_query)
            print("\n🖼️ Blade HTML:")
            print(html_code)
        else:
            print("⚠️ Unsafe or invalid SQL query:")
            print(sql_query)

    except Exception as e:
        print("⚠️ Unexpected response format:", result)
else:
    print("❌ Error:", response.status_code)
    print(response.text)
