FROM python:3.11-slim

# Install system dependencies for Tkinter
RUN apt-get update && apt-get install -y \
    tk \
    libgomp1

# Set working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "--server.port", "8501", "interface.py"]
