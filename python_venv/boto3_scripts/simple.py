import boto3
import pytz
import time
from datetime import datetime

## variable section
seconds = 2

def get_ist_time():
    print("Get the current time in IST (Indian Standard Time)")
    ist = pytz.timezone('Asia/Kolkata')
    utc_now = datetime.now(pytz.utc)
    ist_time = utc_now.astimezone(ist)
    return ist_time

def myvenv():
    return "You are working on venv script setting on macOS..."

# Get and print current IST time
current_ist_time = get_ist_time()
venv_message = myvenv()

# Sleep for specified seconds
print(f"Break for {seconds} seconds...")
time.sleep(seconds)

# Print the current IST time after sleep
print(f"Current Indian Standard Time (IST) is: {current_ist_time}")
print(f"Just printed the function message: {venv_message}")
