# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies
RUN pip install --no-cache-dir openmeteo_requests requests_cache pandas retry-requests Flask matplotlib gunicorn

# Expose the port the app runs on
EXPOSE 5000

# Run the specified command within the container
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
