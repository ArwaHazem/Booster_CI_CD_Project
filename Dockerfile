FROM python:3.6

WORKDIR /app
COPY . /app

# Upgrade pip
RUN python -m pip install --no-cache-dir --upgrade pip

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Make and apply migrations
RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
