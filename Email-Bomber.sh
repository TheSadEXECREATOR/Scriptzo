import smtplib
import getpass
import time
import os

# Styling (ASCII + colors)
os.system("clear")
print("\033[1;32m")
print(r"""
   _____  _____   ______  _____ 
  / ____||  __ \ |  ____||  __ \
 | (___  | |__) || |__   | |__) |
  \___ \ |  _  / |  __|  |  _  / 
  ____) || | \ \ | |____ | | \ \ 
 |_____/ |_|  \_\|______||_|  \_\

       Gmail Email Spammer - by SC
""")
print("\033[0m")

# Input section
your_email = input("Enter your Gmail address: ")
your_pass = getpass.getpass("Enter your Gmail password (App Password recommended): ")
target = input("Target Email: ")
subject = input("Subject: ")
message = input("Message: ")
amount = int(input("How many emails to send?: "))

# Email format
email_text = f"Subject: {subject}\n\n{message}"

# Sending logic
try:
    server = smtplib.SMTP("smtp.gmail.com", 587)
    server.starttls()
    server.login(your_email, your_pass)
    for i in range(amount):
        server.sendmail(your_email, target, email_text)
        print(f"\033[92m[+] Sent email {i+1}/{amount} to {target}")
        time.sleep(0.5)
    server.quit()
    print("\033[94m\n[+] All emails sent successfully.")
except Exception as e:
    print(f"\033[91m[-] Failed to send emails: {e}")
