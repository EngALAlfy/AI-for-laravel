import requests
import json
import os

API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={API_KEY}"
API_KEY = os.getenv('GEMINI_API_KEY')

if not API_KEY:
    raise ValueError("Please set the GEMINI_API_KEY environment variable")

# set generation config
generation_config = {
    "temperature": 0.2,
    "topP": 0.8,
    "topK": 40,
    "maxOutputTokens": 512,
    "candidateCount": 1,
    "responseMimeType": "application/json",
    "responseSchema": {
        "type": "OBJECT",
        "properties": {
            "sql": { "type": "STRING" }
        },
        "required": ["sql"]
    }
}

# Read schema from file
def read_schema():
    schema_file = os.path.join(os.path.dirname(__file__), 'schema_for_gemini.txt')
    try:
        with open(schema_file, 'r') as f:
            return f.read().strip()
    except FileNotFoundError:
        raise FileNotFoundError(f"Schema file not found: {schema_file}")

# get user question
user_question = input("❓ Write your report in English: ").strip()

# إعداد الـ prompt
prompt_text = (
    "You are a SQL assistant. Database type: MySQL.\n"
    "Respond with ONLY a single valid SQL SELECT query inside a JSON object.\n"
    "Do NOT include any DELETE, UPDATE, INSERT, DROP, or dangerous operations.\n"
    "The query must match the given schema, and be safe to run.\n\n"
    "Database schema:\n"
    f"{read_schema()}\n"
    f"Question: {user_question}"
)

# prepare data
data = {
    "contents": [
        {
            "parts": [{"text": prompt_text}]
        }
    ],
    "generationConfig": generation_config
}

# send request
response = requests.post(
    API_URL,
    headers={"Content-Type": "application/json"},
    data=json.dumps(data)
)

# validate response
if response.status_code == 200:
    result = response.json()
    try:
        # Get text sql from response and make it lowe
        generated_text = result['candidates'][0]['content']['parts'][0]['text']
        sql_json = json.loads(generated_text)
        sql_query = sql_json.get("sql", "").strip().lower()

        # تحقق من أنه SELECT فقط
        if sql_query.startswith("select") and not any(keyword in sql_query for keyword in ["delete", "update", "insert", "drop", "alter", "--", ";", "/*", "*/"]):
            print("✅ Generated SQL Query:")
            print(sql_query)
        else:
            print("⚠️ Unsafe or non-SELECT query detected:")
            print(sql_query)

    except Exception as e:
        print("⚠️ Unexpected response format:", result)
else:
    print("❌ Error:", response.status_code)
    print(response.text)
