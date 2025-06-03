<?php

namespace App\Services;

use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class GeminiReportService
{
    protected string $apiKey;
    protected string $apiUrl;

    public function __construct()
    {
        $this->apiKey = config('services.gemini.key');
        $this->apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={$this->apiKey}";
    }

    public function generate(string $userPrompt): array
    {
        $schema = $this->getSchema();
        $prompt = $this->buildPrompt($userPrompt, $schema);

        $payload = [
            'contents' => [
                [
                    'parts' => [['text' => $prompt]]
                ]
            ],
            'generationConfig' => [
                'temperature' => 0.2,
                'topP' => 0.8,
                'topK' => 40,
                'maxOutputTokens' => 1024,
                'candidateCount' => 1,
                'responseMimeType' => 'application/json',
                'responseSchema' => [
                    'type' => 'OBJECT',
                    'properties' => [
                        'sql' => ['type' => 'STRING'],
                        'html' => ['type' => 'STRING']
                    ],
                    'required' => ['sql', 'html']
                ]
            ]
        ];

        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post($this->apiUrl, $payload);

        if ($response->successful()) {
            return $this->parseResponse($response->json());
        }

        throw new Exception("Gemini API Error: " . $response->body());
    }

    protected function getSchema(): string
    {
        return Storage::disk('local')->get('schema_for_gemini.txt');
    }

    protected function buildPrompt(string $question, string $schema): string
    {
        return <<<PROMPT
                You are a MySQL SQL and Laravel Blade HTML assistant.
                First, generate a SAFE and valid SELECT SQL query that answers the question.
                Then, generate a clean Laravel Blade HTML table (Bootstrap-styled) that displays the expected result of this SQL query.
                The Blade code must use @foreach, and include headers and values.
                The data var from the laravel in the blade will be always \$data
                The SQL must not contain any DELETE, UPDATE, INSERT, DROP, or unsafe operations.
                Return your answer as a JSON object with two fields: 'sql' and 'html'.
                
                Database schema:
                {$schema}
                
                Question: {$question}
                PROMPT;
    }

    /**
     * @throws Exception
     */
    protected function parseResponse(array $json): array
    {
        $text = $json['candidates'][0]['content']['parts'][0]['text'] ?? null;

        if (!$text) {
            throw new Exception('Invalid Gemini response format');
        }

        $data = json_decode($text, true);

        if (!isset($data['sql'], $data['html'])) {
            throw new Exception('Missing sql or html in Gemini response');
        }

        $sql = strtolower(trim($data['sql']));
        $unsafe = collect(['delete', 'update', 'insert', 'drop', 'alter', '--', '/*', '*/'])->contains(fn($kw) => str_contains($sql, $kw));

        if (!str_starts_with($sql, 'select') || $unsafe) {
            throw new Exception("Unsafe or invalid SQL: {$sql}");
        }

        return [
            'sql' => $sql,
            'html' => trim($data['html'])
        ];
    }
}
