#!/bin/bash
# Open folder 
cd /home/$USER/Android/Sdk/tools

# Create a string to store avds
avdStr=$(./emulator -list-avds)

# Split string then store as array
avdArr=($(echo $avdStr | tr " " "\n"))

# Info 
echo ""
echo "All devices are listed below"
echo ""

# Show how many avds are listed
for ((idx=1; idx<=${#avdArr[@]}; ++idx))
do
    echo "$idx) ${avdArr[idx-1]}"
done

# Select an avd
echo ""
read -p "Please select an avd: " selected

# Start selected avd
$(./emulator -avd ${avdArr[selected-1]})
