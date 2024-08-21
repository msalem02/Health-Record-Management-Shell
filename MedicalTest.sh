#!/bin/bash

# Path to the medical record and test information files.
MEDICAL_RECORD="medicalRecord.txt"
MEDICAL_TEST="medicaTest.txt"

# Function to check if a file exists and is not empty.
validate_file() {
    if [ ! -f "$1" ] || [ ! -s "$1" ]; then
        echo "Error: File does not exist or is empty."
        exit 1
    fi
}

# Display the main menu for the script.
display_menu() {
    echo "1. Add New Test Result"
    echo "2. Update Test Result"
    echo "3. Delete Test Result"
    echo "4. Retrieve Test Results"
    echo "5. Add New Medical Test"
    echo "6. View All Medical Tests"
    echo "7. Search Tests by Patient ID"
    echo "8. Search for Normal Tests"
    echo "9. Calculate Average Test Values"
    echo "10. Exit"
    echo "Choose an option:"
    read option
    case $option in
        1) add_test_result ;;
        2) update_test_result ;;
        3) delete_test_result ;;
        4) retrieve_test_results ;;
        5) add_medical_test ;;
        6) view_all_medical_tests ;;
        7) search_tests_by_patient ;;
        8) search_up_normal_tests ;;
        9) calculate_average_values ;;
        10) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
}

# Add a new test result to the medical record.
add_test_result() {
    echo "Enter Patient ID, Test Name, Test Date (YYYY-MM), Result with unit, Status:"
    read -r pid tname tdate result status
    # Validate Patient ID and Test Date format.
    if [[ ! $pid =~ ^[0-9]{7}$ ]]; then
        echo "Error: Invalid Patient ID. Must be 7 digits."
        return
    fi
    if [[ ! $tdate =~ ^[0-9]{4}-[0-9]{2}$ ]]; then
        echo "Error: Invalid date format. Use YYYY-MM."
        return
    fi
    # Format and write the test result to the file.
    printf "%7s: %-4s, %7s, %-8s, %s\n" "$pid" "$tname" "$tdate" "$result" "$status" >> $MEDICAL_RECORD
    echo "Test result added successfully."
}

# Update an existing test result in the medical record.
update_test_result() {
    echo "Enter Patient ID to update:"
    read pid
    validate_file $MEDICAL_RECORD
    # Remove existing record.
    grep -v "$pid" $MEDICAL_RECORD > temp.txt
    mv temp.txt $MEDICAL_RECORD
    echo "Enter new Test Name, Test Date (YYYY-MM), Result with unit, Status:"
    read -r tname tdate result status
    # Add the updated record.
    printf "%7s: %-4s, %7s, %-8s, %s\n" "$pid" "$tname" "$tdate" "$result" "$status" >> $MEDICAL_RECORD
    echo "Record updated successfully."
}

# Delete a test result from the medical record.
delete_test_result() {
    echo "Enter Patient ID to delete record:"
    read pid
    validate_file $MEDICAL_RECORD
    # Remove the record.
    grep -v "$pid" $MEDICAL_RECORD > temp.txt
    mv temp.txt $MEDICAL_RECORD
    echo "Record deleted successfully."
}

# Retrieve and display all test results from the medical record.
retrieve_test_results() {
    validate_file $MEDICAL_RECORD
    echo "Current Medical Records:"
    cat $MEDICAL_RECORD
}

# Add a new medical test to the list of tests.
add_medical_test() {
    echo "Enter Test Name, Range, and Unit:"
    read -r name range unit
    # Write the test information to the file.
    printf "%-4s, Range: %s; Unit: %s\n" "$name" "$range" "$unit" >> $MEDICAL_TEST
    echo "Medical test added successfully."
}

# Display all medical tests available.
view_all_medical_tests() {
    validate_file $MEDICAL_TEST
    echo "Current Medical Tests:"
    cat $MEDICAL_TEST
}

# Search for test results by a specific patient ID.
search_tests_by_patient() {
    echo "Enter Patient ID:"
    read pid
    validate_file $MEDICAL_RECORD
    echo "Tests for Patient ID $pid:"
    grep "$pid" $MEDICAL_RECORD
}

# Search for up normal tests by test name.
search_up_normal_tests() {
    echo "Enter Test Name for up normal search:"
    read tname
    validate_file $MEDICAL_RECORD
    echo "Up normal tests for $tname:"
    grep "$tname" $MEDICAL_RECORD 
}

# Calculate and display the average result value for a specified test.
calculate_average_values() {
    echo "Enter Test Name to calculate average:"
    read tname
    validate_file $MEDICAL_RECORD
    # Calculate average using awk.
    awk -F', ' "/$tname/ {count++; sum += \$3} END {if (count > 0) print \"Average:\", sum/count; else print \"No records found.\"}" $MEDICAL_RECORD
}

# Main loop to display the menu repeatedly.
while true; do
    display_menu
done

