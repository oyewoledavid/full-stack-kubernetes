#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z users-db 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

# Apply migrations
echo "Running database migrations..."

# Run database table creation
python init_db.py


python manage.py run -h 0.0.0.0
