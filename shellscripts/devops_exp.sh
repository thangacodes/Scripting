#!/bin/bash
# Display the current date and time when the script is executed
echo "The script was executed at: $(date '+%d-%m-%Y %H:%M:%S')"
# Ask for inputs
echo "What is your good name?"
read good_name
echo "What is your experience in IT?"
read experience
echo "What is your Primary Skills?"
read primary_skills
echo "What is your Secondary Skills?"
read secondary_skills
echo "Which cloud do you prefer to use and work with day in and day out?"
read cloud

# Now we can assign the inputs to arguments (simulating positional parameters)
set -- "$good_name" "$experience" "$primary_skills" "$secondary_skills" "$cloud"

# Output the results as positional arguments
echo "Your good name is: $1"
echo "Your IT experience is: $2"
echo "Your Primary skills sets are: $3"
echo "Your Secondary skills are: $4"
echo "Your interested in cloud: $5"

# Combine all names and display them as a single string
full_knowledge="My name is $1, and I have around $2 years of experience and expertise in: $3, $4, $5"
echo $full_knowledge
