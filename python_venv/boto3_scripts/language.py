import time

print("Next logic begins shortly...")

def skill_set():
    user_input = input("Do you know programming languages like ('Java', 'Python', 'Golang'): ").capitalize()  
    if user_input == "Python":
        print(f"He or She is good at {user_input}")
    elif user_input == "Java":
        print(f"He or She is good at {user_input}")
    elif user_input == "Golang":
        print(f"He or She is good at {user_input}")
    else:
        print("Please select a correct choice available here at the institute")

# Adding a slight delay before the prompt appears.
time.sleep(1)
skill_set()


## Note: 
# Capitalize input to handle case-sensitivity
