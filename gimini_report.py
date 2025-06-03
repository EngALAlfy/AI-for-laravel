import requests
import json
import os

API_KEY = os.getenv('GEMINI_API_KEY')
if not API_KEY:
    raise ValueError("Please set the GEMINI_API_KEY environment variable")

API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={API_KEY}"

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
            "html": { "type": "STRING" }
        },
        "required": ["html"]
    }
}
# get user question
user_question = input("❓ Write your report sql in English: ").strip()

prompt_text = (
    "You are a Laravel Blade template generator.\n"
    "You will be given a SQL SELECT query.\n"
    "Your task is to generate a clean, responsive HTML table (using Bootstrap classes) that displays the output of this query.\n"
    "Assume this will be used in a Laravel Blade file.\n"
    "Use @foreach and @php where appropriate.\n"
    "Include column headers and table body based on the expected fields in the result set.\n"
    "Do NOT include any dangerous code, just valid Blade and HTML.\n\n"
    f"SQL Query:\n{user_question}\n"
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
        # Get text html from response and make it lowe
        generated_text = result['candidates'][0]['content']['parts'][0]['text']
        html_json = json.loads(generated_text)
        html = html_json.get("html", "").strip().lower()
        print(html)

    except Exception as e:
        print("⚠️ Unexpected response format:", result)
else:
    print("❌ Error:", response.status_code)
    print(response.text)
