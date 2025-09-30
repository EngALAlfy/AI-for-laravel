# Dockerfile
FROM python:3.11-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY mcp_server.py .

# Expose port (FastMCP usually runs on 9000)
EXPOSE 9000

# Run the server
CMD ["python", "mcp_server.py"]
