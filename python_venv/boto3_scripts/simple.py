import boto3
import pytz
import time
from datetime import datetime

## variable section
seconds = 2

# Function to get the current time in IST (Indian Standard Time)
def get_ist_time():
    print("Getting the current time in IST (Indian Standard Time)...")
    ist = pytz.timezone('Asia/Kolkata')
    utc_now = datetime.now(pytz.utc)
    ist_time = utc_now.astimezone(ist)
    return ist_time

# Function to collect family details
def my_family():
    father_name = input("Please enter your father's name: ")
    mother_name = input("Please enter your mother's name: ")
    wife_name = input("Please enter your wife's name: ")
    first_baby_name = input("Please enter your first baby name: ")
    second_baby_name = input("Please enter your second baby name: ")
    place_of_birth = input("Please enter your place of birth: ")
    family_details = {
        'Father': father_name,
        'Mother': mother_name,
        'Wife': wife_name,
        'Baby1': first_baby_name,
        'Baby2': second_baby_name,
        'Place of Birth': place_of_birth
    }
    return family_details

# Function to collect family members educational details
def edu_detail():
    my_edu = input("Please enter my qualification: ")
    wife_edu = input("Please enter your wife qualification: ")
    family_edu = {
        'My_education': my_edu,
        'Wife_education': wife_edu
    }
    return family_edu

# Function to collect family members dob details
def family_dob():
    my_dob = input("Please enter my date of birth: ")
    wife_dob = input("Please enter your wife date of birth: ")
    dob = {
        'dob1': my_dob,
        'dob2': wife_dob
    }
    return dob

# Get current IST time
current_ist_time = get_ist_time()

# Collect family details
family_details = my_family()

# Collect family educational details
educations = edu_detail()

# Collect family dob details
birth = family_dob()

# Sleep for specified seconds
print(f"Break for {seconds} seconds to print the value...")
time.sleep(seconds)

# Print the collected family details and current IST time
print("Indian Standard Time: ")
print("---------------------")
print(f"Current Indian Standard Time (IST) is: {current_ist_time.strftime('%Y-%m-%d %H:%M:%S')}")
print("\n")
print("Family Details: ")
print("---------------")
for key, value in family_details.items():
    print(f"{key}: {value}")
print("\n")
print("Family Educational Details: ")
print("---------------------------")
for key, value in educations.items():
    print(f"{key}: {value}")
print("\n")
print("Family DOB Details: ")
print("--------------------")
for key, value in birth.items():
    print(f"{key}: {value}")
print("\n")
