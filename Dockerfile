#Python image
FROM public.ecr.aws/docker/library/python:latest

# Working directory
WORKDIR /app

# Copy the rest of the application code to the working directory
COPY  /analytics/ /app

# Python dependencies
RUN pip install -r /app/requirements.txt

# Correct import error of Werkzeug
RUN pip install --upgrade flask

# Expose port 5153
EXPOSE 5153

# Environment variables
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase

# Command to run the application
CMD python app.py