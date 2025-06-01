# SQL Query Assistant

A Python-based SQL query assistant that uses Gemini AI to generate safe MySQL queries based on natural language input.

## Features

- Natural language to SQL query conversion
- Built-in safety checks to prevent dangerous operations
- JSON-formatted responses
- Support for complex database schema

## Database Schema

The system supports multiple tables including:
- areas
- assist_drivers
- bookings
- branches
- carts
- and more...

## Usage

1. Set your Gemini API key in the script
2. Run the script
3. Enter your query in English
4. Get the corresponding SQL query

## Security

- Only SELECT queries are allowed
- No destructive operations (DELETE, DROP, etc.)
- Input validation and sanitization

## Requirements

- Python 3.x
- `requests` library