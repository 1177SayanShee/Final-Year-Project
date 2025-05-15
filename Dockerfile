# Use a compatible Python version
FROM python:3.10-slim

# Set environment variables to avoid .pyc and buffer issues
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# # Set work directory
# WORKDIR /app

# Set working directory to api folder since main.py is inside it
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt



# Copy everything into the container
COPY . .

# Expose port (FastAPI runs on 8000 by default)
EXPOSE 8000

# Command to run your FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["uvicorn", "api.main:app", "--host", "127.0.0.1", "--port", "8000"]
# CMD ["uvicorn", "main:app", "--host", "127.0.0.1", "--port", "8000"]




