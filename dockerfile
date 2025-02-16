# استفاده از ایمیج رسمی Python
FROM python:3.10

# تنظیم دایرکتوری کاری
WORKDIR /app

# کپی کردن فایل‌های مورد نیاز
COPY requirements.txt .

# نصب پکیج‌ها
RUN pip install --no-cache-dir -r requirements.txt

# کپی کل پروژه
COPY . .

# جمع‌آوری فایل‌های استاتیک
RUN python manage.py collectstatic --noinput

# اجرای Gunicorn برای سرو کردن Django
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "myproject.wsgi:application"]
