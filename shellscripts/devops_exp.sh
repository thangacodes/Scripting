#!/bin/bash
# Display the current date and time when the script is executed
echo "The script was executed at: $(date '+%d-%m-%Y %H:%M:%S')"
# Ask for inputs
echo "What is your experience in IT?"
read experience
echo "What is your Primary Skills?"
read primary_skills
echo "What is your Secondary Skills?"
read secondary_skills
echo "Which cloud do you prefer to use and work with day in and day out?"
read Cloud

# Now we can assign the inputs to arguments (simulating positional parameters)
set -- "$experience" "$primary_skills" "$secondary_skills" "$Cloud"

# Output the results as positional arguments
echo "Your good name is: $1"
echo "Your Skill sets are: $2"
echo "Your Primary Cloud is: $3"
echo "Your Secondary skill sets are: $4"

# Combine all names and display them as a single string
full_knowledge="You are having $1 years of experience and expertise in: $2, $3, $4"
echo $full_knowledge
