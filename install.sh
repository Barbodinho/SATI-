#!/bin/bash
# ==============================
# Telegram Panel Bot Installer
# Author: Barbod
# ==============================

echo "🚀 شروع نصب Telegram Panel Bot ..."

# 1. به‌روزرسانی سیستم
apt update -y
apt install -y python3 python3-pip curl

# 2. کلون یا دانلود پروژه
if [ ! -d "telegram-panel-bot" ]; then
  echo "⬇️ در حال دانلود سورس پروژه از GitHub..."
  mkdir telegram-panel-bot
  cd telegram-panel-bot || exit
  curl -O https://raw.githubusercontent.com/Barbodinho/SATI-/main/telegram-panel-bot/main.py
  echo "aiogram==2.25.1" > requirements.txt
  echo "python-dotenv==1.0.1" >> requirements.txt
else
  cd telegram-panel-bot || exit
fi

# 3. نصب وابستگی‌ها
echo "📦 در حال نصب وابستگی‌ها..."
pip3 install -r requirements.txt

# 4. اجرای بار اول (ایجاد .env و DB)
echo "⚙️ در حال اجرای اولیه برای تنظیم توکن و ادمین..."
python3 main.py

# 5. پیشنهاد اجرای در پس‌زمینه
echo ""
echo "✅ نصب کامل شد!"
echo "برای اجرای دائمی، از یکی از دستورات زیر استفاده کن:"
echo ""
echo "👉 اجرای موقت:"
echo "python3 main.py"
echo ""
echo "👉 اجرای در پس‌زمینه:"
echo "nohup python3 main.py &"
echo ""
echo "👉 یا با screen:"
echo "screen -S panelbot"
echo "python3 main.py"
echo ""
echo "پایان نصب 🚀"
